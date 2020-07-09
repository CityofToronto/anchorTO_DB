-- FUNCTION: code_src.send_email(text, text[], text[], text[], text, text, text, text, text, text)

-- DROP FUNCTION code_src.send_email(text, text[], text[], text[], text, text, text, text, text, text);
 
CREATE OR REPLACE FUNCTION code_src.send_email(
	from_addr text,
	to_addr_list text[],
	cc_addr_list text[],
	bcc_addr_list text[],
	subject text,
	login text,
	password text,
	message_text text DEFAULT ''::text,
	message_html text DEFAULT ''::text,
	smtpserver text DEFAULT 'localhost'::text)
    RETURNS text
    LANGUAGE 'plpython2u'

    COST 100
    VOLATILE 
AS $BODY$ 
#
#  --select send_email('sentFromEmail',array['destination emails'],array['cc'],array['bcc'],'Subject','<USERNAME>','<PASSWORD>','Text message','HTML message','<MAIL.MYSERVER.COM:PORT>')
#  select code_src.send_email('slee5@toronto.ca'::text, array['steve.lee@toronto.ca'], null, null,'Subject:Testing','','','Text message','<h1>HTML message</h1>','localhost')
	import smtplib
	from email.mime.multipart import MIMEMultipart
	from email.mime.text import MIMEText
	msg = MIMEMultipart('alternative')
	msg["Subject"] = subject
	msg['From'] = from_addr
	msg['To'] = ', '.join(to_addr_list)
	if cc_addr_list:      
	  msg['Cc'] = ', '.join(cc_addr_list)
	  plpy.info(': '+str(len(cc_addr_list)))
	if message_text.replace(' ', '')!='':
		part1 = MIMEText(message_text, 'plain')
		msg.attach(part1)
	if message_html.replace(' ', '')!='':
		part2 = MIMEText(message_html, 'html')
		msg.attach(part2)
	#If no message (html or text) then stop script execution.
	if message_html.replace(' ', '')=='' and message_text.replace(' ', '')=='':
		plpy.info('An error ocurred: No message to send.')
		return False
	#Bcc needs to be added now, it should not be added to message.
	all_addr_list = to_addr_list
	if cc_addr_list:
	  all_addr_list = all_addr_list + cc_addr_list
	if bcc_addr_list:
	  all_addr_list = all_addr_list + bcc_addr_list
	server = smtplib.SMTP(smtpserver)
	#server.starttls()
	#server.ehlo()
	#server.login(login, password)
	#s = smtplib.SMTP()
	#s.connect("mail.toronto.ca")
	#s.sendmail(emailfrom,emailtolist, msg.as_string())
	problems = server.sendmail(from_addr, all_addr_list,msg.as_string())
	server.quit()
	#if we have problems then print the problem and return error message
	if len(problems)>0:
		plpy.info('An error ocurred: '+str(problems))
		return str(problems)
	else:
		return 'OK'
$BODY$;

ALTER FUNCTION code_src.send_email(text, text[], text[], text[], text, text, text, text, text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.send_email(text, text[], text[], text[], text, text, text, text, text, text) TO network;

REVOKE ALL ON FUNCTION code_src.send_email(text, text[], text[], text[], text, text, text, text, text, text) FROM PUBLIC;
