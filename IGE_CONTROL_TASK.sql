--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 24, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_CONTROL_TASK...
truncate table IGE_CONTROL_TASK;
--PROMPT Loading IGE_CONTROL_TASK...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (10, 100, 'CLOSED', 'Initially, was created to browse data, monitor maintenance tasks, and support S&M staff. Eventually, some tasks were also submitted under this control task for data correction.', 'STREET/ADDRESS', 209083, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (11, 101, 'CLOSED', null, 'STREET/ADDRESS', 213354, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (18, 109, 'CLOSED', null, 'STREET/ADDRESS', 200036, 200063);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (45, 139, 'CLOSED', 'em-321York Mills Rd, former York Mills Park, now Irving Paisley Park; Jan 15, 2009', 'STREET/ADDRESS', 200211, 200241);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (57, 151, 'CLOSED', 'em-337 Perth Av, add entr for 61 Antler St, Jan 19, 2009', 'STREET/ADDRESS', 213377, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (62, 157, 'CLOSED', 'mm 52N Modify 40 to 50 Elliotwood Crt/SolidWaste2008/FldChkd18Dec2008', 'STREET/ADDRESS', 213381, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (72, 167, 'CLOSED', 'JF/MM Add 50 Glen Cedar Road as LE to identify existing parcel of land as per JF-Assmt-Parks-GlenCedarRd-WinonaDr-20081220.pdf', 'STREET/ADDRESS', 213389, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (93, 191, 'CLOSED', 'mm 46N Modify 59 Huxley Rd entr to prm/MPAC', 'STREET/ADDRESS', 213406, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (100, 198, 'CLOSED', 'mm- Add 2 laneways, 3 walkways', 'STREET/ADDRESS', 213411, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (116, 217, 'CLOSED', 'mm 46H Del Ln N Sunnylea W Hazelridge/APSET 46H320401/FldChkd 14Aug2008', 'STREET/ADDRESS', 213423, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (161, 273, 'CLOSED', null, 'STREET/ADDRESS', 201543, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (190, 303, 'IN PROGRESS', 'JF Add Nos. 561-569 Silverthorn Av ', 'STREET/ADDRESS', 201890, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (196, 309, 'CLOSED', 'mm-extend Esther Shiner Blvd/Fld.Chkd11Dec2008/Official opened', 'STREET/ADDRESS', 213477, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (197, 310, 'CLOSED', 'JF - Reassign 40 Banting Av as LE for 1035 Sheppard Av W', 'STREET/ADDRESS', 213478, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (203, 316, 'CLOSED', 'dm - 406 Livingston Rd - water billing request e-mail ltr  Apr07/09', 'STREET/ADDRESS', 213483, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (211, 324, 'CLOSED', 'dm- adding intersections and centrelines - Strangford Lane - Scar ltr Sep 17/07', 'STREET/ADDRESS', 213489, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (230, 343, 'HOLD', 'JF-MM-Merge-3011-3019 Bathurst St ', 'STREET/ADDRESS', 202431, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (231, 344, 'COMPLETED', 'Removing one-way segment from Mariposa Avenue between St. Clair Avenue West and lane', 'STREET/ADDRESS', 202438, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (243, 358, 'CLOSED', 'em-add 252 Queen St W, entr for 168 John St; April 24, 2009', 'STREET/ADDRESS', 213511, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (245, 360, 'CLOSED', 'mm-Ext Laneway Ln N Gerrard E Hiawa-ByLaw', 'STREET/ADDRESS', 213513, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (255, 369, 'CLOSED', 'em-add 112 Corporate Dr, (Lee Centre Park) May 6, 2009', 'STREET/ADDRESS', 213521, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (256, 370, 'CLOSED', 'em- add 10 Wilmar Rd (Greenfield Park) May 6, 2009', 'STREET/ADDRESS', 213522, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (263, 378, 'CLOSED', 'ld/edit 2500 Birchmount Rd to SE', 'STREET/ADDRESS', 213527, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (275, 391, 'CLOSED', 'ld/add walkways fr Ridge Hill Dr, Old Forest Hill Rd to Wembly Rd-Apset 49L12W4', 'STREET/ADDRESS', 213535, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (292, 411, 'CLOSED', 'mm 45N Modify 450 Albion Rd to ENT to 2 Arcot Blvd/ParksLet-02Jun2009', 'STREET/ADDRESS', 213549, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (293, 412, 'HOLD', 'JF-MM-Add 276A, 276B Searle Avenue, 319 Brighton Avenue - April 20, 2009.', 'STREET/ADDRESS', 203119, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (302, 421, 'CLOSED', 'mm Add 567A Browns Line/Solid Waste2009/MPAC', 'STREET/ADDRESS', 213555, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (303, 422, 'CLOSED', 'dm - move 17,22 Beswick Park Crt to correct parcel -Scarlet Dec 04/09', 'STREET/ADDRESS', 213556, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (305, 424, 'CLOSED', 'Ld/del Ln W Bay N Grenville', 'STREET/ADDRESS', 213558, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (308, 427, 'CLOSED', 'Ld/Del Ln S Queen W Walnut/CBL 368-2009', 'STREET/ADDRESS', 213560, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (309, 428, 'CLOSED', 'ld/add 12 to 20 -SSE to 10-20 Bergamot Ave-FC 4Jun2009/Amb/Mpac/canpost', 'STREET/ADDRESS', 213561, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (339, 459, 'CLOSED', 'Ld/Added 16 Verona Ave', 'STREET/ADDRESS', 213582, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (347, 468, 'HOLD', 'em-cofa-91 Perry Cr, 7 Orrall Av, 1412 Islington Av, Aug 19, 09', 'STREET/ADDRESS', 203792, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (348, 469, 'CLOSED', 'em-assign 7A King Edward Av; Aug 19, 09', 'STREET/ADDRESS', 213586, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (349, 467, 'IN PROGRESS', 'em-cofa-329, 331 Walmer Rd; Aug 19, 09', 'STREET/ADDRESS', 203792, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (354, 475, 'HOLD', 'JF-LD-Merge 127 129 Queen St E., April 17, 2009', 'STREET/ADDRESS', 203859, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (357, 478, 'CLOSED', 'JF-DM-Add 95A Memorial Park Avenue, April 21, 2009.', 'STREET/ADDRESS', 213592, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (363, 484, 'CLOSED', 'JF-MM- Add 25 Roycrest Avenue, April 24, 2009, revert back to No. 23, September 20, 2010', 'STREET/ADDRESS', 213596, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (372, 493, 'CLOSED', 'em-revision for 359 Roehampton Av; add entr 363A, 363B, 365A, 365B, 365C, 367A, 367B, 367C, 367D; Aug 25, 2009', 'STREET/ADDRESS', 213604, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (384, 507, 'CLOSED', 'em-add 17, 19, 23, 25, 29 and 31 Connolly St; entr for 1884 Davenport Rd; Sept 1, 09', 'STREET/ADDRESS', 213612, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (402, 525, 'HOLD', 'JF-DM-Add 91 Heale Av, May 6, 2009', 'STREET/ADDRESS', 204307, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (433, 556, 'HOLD', 'JF-MM-Add 64AB Codsell Av, May 8, 2009', 'STREET/ADDRESS', 204427, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (464, 587, 'HOLD', 'JF-MM-Add Add 91A to 105B Finch Av W and 106 128 Lorraine Dr, June 12, 2009', 'STREET/ADDRESS', 204732, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (465, 589, 'CLOSED', 'JF-MM-Add 276 Horsham Av , March 5, 2009', 'STREET/ADDRESS', 213683, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (466, 588, 'CLOSED', 'JF-LD-Add 575A and 579A St Clair Av West, February 26, 2009', 'STREET/ADDRESS', 213682, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (496, 619, 'CLOSED', 'em-add 8 Seasons Dr; prop school; Oct 13, 2009', 'STREET/ADDRESS', 213702, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (497, 620, 'CLOSED', 'em- add 1 Elward Blvd, structure for 3 Elward Blvd; Oct 13, 2009', 'STREET/ADDRESS', 213703, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (498, 623, 'CLOSED', 'em-add 113-123 Ellesmere Rd; entr for 111; Oct 13, 2009', 'STREET/ADDRESS', 213706, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (499, 621, 'CLOSED', 'em-add 1903-1911 Ellesmere Rd, entr for 1901; Oct 13, 2009', 'STREET/ADDRESS', 213704, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (500, 622, 'CLOSED', 'em-add 1577-1601 Ellesmere Rd; entr for 1575; Oct 13, 2009', 'STREET/ADDRESS', 213705, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (561, 687, 'CLOSED', 'em-CofA 255 Christie St, 3 parcels: 255 Chr, 38, 40 Yarmouth Rd; Nov 4, 09', 'STREET/ADDRESS', 213761, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (562, 686, 'CLOSED', 'em-add 27 Sheffer Terrace, renum from 353 Assiniboine Rd, pt of 4700 Keele St; Nov 4, 09', 'STREET/ADDRESS', 213760, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (563, 688, 'CLOSED', 'mm-modify Ln S Front E George to Taylor''s Wharf Lane/StNaming Let-30Oct2009', 'STREET/ADDRESS', 213762, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (575, 700, 'CLOSED', 'em-add 9 Doris Anderson Crt, entr to garage; entr for 75 Carroll St; Nov 16, 09', 'STREET/ADDRESS', 213769, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (579, 704, 'CLOSED', 'em-add 7 Canadian Rd; entr for 1411 Warden Av; Nov 18, 09', 'STREET/ADDRESS', 213772, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (580, 707, 'COMPLETED', 'em-add 15 Bruyeres Mews, res condo, former 35 Iannuzzi St; add 5, 9 Bruyeres Mews-retail, 20 Bathurst St-retail; Nov 18, 09', 'STREET/ADDRESS', 205674, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (581, 706, 'HOLD', 'em-sever 1359 Dupont St ; 7 freehold; 710-722 St Clarens Av; Nov 18, 09', 'STREET/ADDRESS', 205674, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (582, 705, 'HOLD', 'em-CofA 576 Dufferin St; add 574; Nov 18, 09', 'STREET/ADDRESS', 205674, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (583, 708, 'CLOSED', 'em-add 260 Sackville St (prop condo), live-work units: 74, 76 Cole St, 71, 73 Oak St, 256, 258, 262, 264 Sackville St; Nov 18, 09', 'STREET/ADDRESS', 205779, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (591, 716, 'CLOSED', null, 'STREET/ADDRESS', 205862, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (592, 717, 'CLOSED', 'Adding sections of Mimico Creek Trail for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 213780, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (595, 720, 'CLOSED', 'Adding sections of Berner Trail Park Trail and Wickson Trail Park Trail  for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 213782, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (604, 729, 'HOLD', 'em-omb for 33, 35 Glen Rush Blvd, add 33, 35 Glen Rush Blvd and 232 Coldstream Av; Dec 11, 09', 'STREET/ADDRESS', 205930, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (646, 772, 'CLOSED', 'To move 145 Cumberland St as per LIM/EM', 'STREET/ADDRESS', 213813, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (648, 774, 'CLOSED', 'JF-MM-Add 136 Florence Avenue, September 22, 2009.', 'STREET/ADDRESS', 213814, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (649, 775, 'CLOSED', 'JF-MM-Add 34 Preakness Drive, November 10, 2009', 'STREET/ADDRESS', 213815, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (656, 782, 'CLOSED', 'em-renum 58 to 60 Highland Cres; Jan 20, 2010', 'STREET/ADDRESS', 213821, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (659, 785, 'CLOSED', 'ld/56J22-edit 233V to 233A McIntosh St-ML 15Jan2010/FC 17Feb08/Mpac', 'STREET/ADDRESS', 213823, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (660, 786, 'CLOSED', 'Lady Fernway area - fix addr loc/RefMap', 'STREET/ADDRESS', 213824, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1, 2, 'IN PROGRESS', 'Batch transaction', 'BATCH_UPDATE', 1, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (670, 795, 'CLOSED', 'ld/54J-Del 2180-2182, 2192-2194; move 2190 Danforth Ave into parcel-cadastral/Mpac/ITmeena', 'STREET/ADDRESS', 213831, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (731, 858, 'CLOSED', 'mm-del non-existing CPR priv line from Ashtonbee Rd up to S of Ellesmere Rd/On-site/PhotoMap2009', 'STREET/ADDRESS', 213874, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (759, 887, 'HOLD', 'em-cofa 3 Tippet Rd and 44 Champlain Blvd; March 3, 2010', 'STREET/ADDRESS', 207283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (760, 888, 'HOLD', 'em-cofa; 64-76 Olga St; March 4, 2010; pt of Midland file', 'STREET/ADDRESS', 207283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (761, 889, 'HOLD', 'em-cofa 129 Virginia Av; add 127; March 3, 2010', 'STREET/ADDRESS', 207283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (762, 891, 'HOLD', 'em-cofa 34 Forty First St; add 36; March 3, 2010', 'STREET/ADDRESS', 207283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (763, 892, 'HOLD', 'em-amal 20 Marina Av and unnumbered land, 2 new bldgs, add 22 Marina Av; March 4, 2010', 'STREET/ADDRESS', 207283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (764, 890, 'CLOSED', 'em-renum 58 to 58A Pegasus Trail; March 4, 2010', 'STREET/ADDRESS', 213894, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (776, 904, 'CLOSED', null, 'STREET/ADDRESS', 213909, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (783, 911, 'CLOSED', 'mm-close Symes Rd N of Cannes Crt - wall barrier/PoliceKO-15Mar2010/PhotoMap2009', 'STREET/ADDRESS', 213915, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (785, 913, 'CLOSED', 'em-add 6035-6071 entr for 6061 Yonge St; to assmt change range 6043-6071 Yonge St to 6061; March 12, 2010', 'STREET/ADDRESS', 213917, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (799, 927, 'HOLD', 'em-amal 91, 93, 97 St George St into 95; expans UofT; March 18, 2010', 'STREET/ADDRESS', 207624, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (815, 944, 'CLOSED', 'ld/edit fcode/name 500 Sandhurst Crcl to Private school-emailed 10Mar2010', 'STREET/ADDRESS', 213940, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (816, 943, 'CLOSED', 'em-add 158, 162 Fallingbrook Rd, entr for 160; March 26, 2010', 'STREET/ADDRESS', 213939, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (836, 964, 'CLOSED', 'ld/52J12-edit SE 1048 Broadview Ave to LSSE a live/work condo. Delete 1042 to 1048A & 1042-1048 Broadview Ave. THs will be considered units-Torlet 17Aug2010/inq emailed 6Mar2010', 'STREET/ADDRESS', 213956, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (911, 1041, 'CLOSED', 'mm-close Earl Pl and Huntley St at Earl St/PhotoMap2009/FldChkd-3May2010', 'STREET/ADDRESS', 213998, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (999, 1131, 'CLOSED', 'Making coorections to one-way streets based on turn restriction audit', 'STREET/ADDRESS', 214051, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1018, 1150, 'IN PROGRESS', 'Changing one-way on Brunswick Avenue from Ulster Street and a point 43.0 metres north of College Street (the first private lane north of College Street)', 'STREET/ADDRESS', 209183, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1036, 1169, 'CLOSED', 'JF-6410 Middlefield Rd, June 23, 2010', 'STREET/ADDRESS', 214065, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1037, 1170, 'CLOSED', 'JF-211A Laird Dr, June 22, 2010', 'STREET/ADDRESS', 214066, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1038, 1171, 'CLOSED', 'JF-211 Laird Dr, June 17, 2010', 'STREET/ADDRESS', 214067, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1054, 1189, 'IN PROGRESS', 'Changing one-way on Logan Avenue from a point 200 metres south of Eastern Avenue and Eastern Avenue', 'STREET/ADDRESS', 209347, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1065, 1205, 'HOLD', 'em-cofa for 69 Forty First St, add 67; June 30, 2010', 'STREET/ADDRESS', 209438, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1110, 1250, 'CLOSED', 'dm - moving ENTR 3640 to 3648 Kingston Rd to PRIME 3650 - SCltr/ photo Jul 19/10', 'STREET/ADDRESS', 213346, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1113, 1253, 'CLOSED', 'em-renumber 37A, 37B, 39A, 39B to 35C, 35D, 37 and 39 Bay St; July 14, 2010', 'STREET/ADDRESS', 213349, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1118, 1258, 'IN PROGRESS', 'em-add 11, 25, 51, 61 Dockside Dr, 115, 125, 155 and 185 Queens Quay East; July 16, 2010', 'STREET/ADDRESS', 209871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1297, 1443, 'CLOSED', 'dm - delete segment - Plumrose Blvd to end contiguous street - e-mail Nov 09/10', 'STREET/ADDRESS', 214217, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1304, 1451, 'CLOSED', 'JF-LD-291 South Kingsway, June 3, 2010', 'STREET/ADDRESS', 214224, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1305, 1452, 'CLOSED', 'JF-MM-702 Weston Rd, November 9, 2010', 'STREET/ADDRESS', 214225, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1306, 1453, 'HOLD', 'JF-MM-166 Horsham Av, November 4, 2010', 'STREET/ADDRESS', 211250, -1);
--commit;
--PROMPT 100 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1307, 1454, 'CLOSED', 'mm-modify Ln E Melita Cres S Lambertlodge to Tony Silipo Way/By-Law 423/2010', 'STREET/ADDRESS', 214226, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1312, 1459, 'CLOSED', 'ld/46H-deleted 606-612 The Queensway-dup_range_addr_25rply GCC SArzande Oct2010/Mpac', 'STREET/ADDRESS', 214231, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1317, 1464, 'CLOSED', 'Harnworth Dr,Shadberry Dr fix addrs loc/Cadastral', 'STREET/ADDRESS', 214236, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1319, 1466, 'HOLD', 'em-cofa for 43, 50 Upton Rd, 743 Warden Av, new : 37 Upton Rd; Nov 24, 2010', 'STREET/ADDRESS', 211361, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1323, 1470, 'IN PROGRESS', 'em-renumber 2130 Bayview Av to 10 Hargrave La, add 1-65, 10-82 Hargrave La, add 2102-2166 Bayview Av; Nov 26, 2010', 'STREET/ADDRESS', 211386, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1328, 1475, 'HOLD', 'em-amal 3857-3865 Lake Shore Blvd W, and 96 Forty First St, into 3865 Lake Shore Blvd W, res condo; Dec 1, 2010', 'STREET/ADDRESS', 211437, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1331, 1478, 'CLOSED', 'em-add 90 Lothian Av; Fairfield Park; Dec 3, 2010', 'STREET/ADDRESS', 214248, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1332, 1479, 'CLOSED', 'em-add 70 Lothian Av; city-owned, open space, parking; Dec 3, 2010', 'STREET/ADDRESS', 214249, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1334, 1481, 'CLOSED', 'dm - edit ENTR 5975, 6005 Steeles Ave E to PRIME 5995 - SC ltr Mar 21, 2007', 'STREET/ADDRESS', 214251, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1338, 1485, 'CLOSED', 'dm -add munic number - 50 Vivian Rd - Jul 14/08', 'STREET/ADDRESS', 214254, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1339, 1487, 'CLOSED', 'em-add 12 Marilyn Av; Dec 1, 2010', 'STREET/ADDRESS', 214256, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1340, 1488, 'CLOSED', 'em-add 85 Varsity Rd, Dec 1, 2010', 'STREET/ADDRESS', 214257, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1341, 1486, 'CLOSED', 'em-add 1029A McNicoll Av; Dec 1, 2010', 'STREET/ADDRESS', 214255, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1345, 1492, 'CLOSED', 'ld/Edit to prm 112 George St', 'STREET/ADDRESS', 214260, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1346, 1493, 'CLOSED', null, 'STREET/ADDRESS', 214261, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1359, 1506, 'CLOSED', 'em-add 1085 St Clair Av W; entr for 1083; Jan 7, 2011', 'STREET/ADDRESS', 214271, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1366, 1513, 'IN PROGRESS', 'Extending GATINEAU HYDRO CORRIDOR TRL at Kennedy Rd and PHARMACY AVE.', 'STREET/ADDRESS', 211778, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1377, 1524, 'COMPLETED', 'em-add 126-158, 133-159 Bob Yuill Dr, 2-28 Mary Chapman Blvd, 1-123, 24-66 Isaac Devins Blvd; Jan 12, 2011', 'STREET/ADDRESS', 211855, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1387, 1534, 'HOLD', 'JF-MM-14 Carrington Av, December 1, 2010', 'STREET/ADDRESS', 212024, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1388, 1535, 'CLOSED', 'JF-MM-48-62 Monclova Rd, December 29, 2010', 'STREET/ADDRESS', 214287, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1393, 1540, 'CLOSED', 'em-add 275, 305 Queen''s Plate Dr, Jan 18, 2011', 'STREET/ADDRESS', 214290, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1395, 1542, 'IN PROGRESS', 'ld/50G-added new gate entrance at Remembrance Dr.', 'STREET/ADDRESS', 212055, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1396, 1543, 'IN PROGRESS', 'Adding Gatineau Hydro Corridor Trail from Marcos Boulevard (Lawrence) to Orton Park Rd', 'STREET/ADDRESS', 212056, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1397, 1544, 'CLOSED', 'ld/59L-edit 22 Morningside Ave to entr to 480 Guildwood Pkwy-mpac/em', 'STREET/ADDRESS', 214292, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1398, 1545, 'HOLD', 'JF-LD-79 Bedford Park Av, January 24, 2011', 'STREET/ADDRESS', 212084, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1399, 1546, 'HOLD', 'JF-MM-51 Treeview Dr, January 14, 2011', 'STREET/ADDRESS', 212084, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1402, 1549, 'CLOSED', 'JF-LD-1379 Bloor St W, October 14, 2010', 'STREET/ADDRESS', 214294, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1404, 1551, 'CLOSED', 'mm-Elana Dr,Picaro Dr fix addr loc/Cadastral', 'STREET/ADDRESS', 214296, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1415, 1564, 'HOLD', 'em-revision, former 39 Green Belt Dr; new 200 David Dunlap Circle; Feb 2, 2011', 'STREET/ADDRESS', 212283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1416, 1562, 'CLOSED', 'em-amal 20, 30 Maud St, into 20 Maud St; 30-entr; Feb 2, 2011', 'STREET/ADDRESS', 214304, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1417, 1563, 'CLOSED', 'em-120, 130 Harbour St, 10 York St entr for 120 Harbour St; Feb 2, 2011', 'STREET/ADDRESS', 214305, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1418, 1565, 'CLOSED', 'mm-Blaney Cres, Petiole Rd (fix addr loc)/Cadastral', 'STREET/ADDRESS', 214306, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1419, 1566, 'IN PROGRESS', 'dm-jf - moving ENTR 2867 Kennedy Rd to PRIME 2885 to fix - SC e-mail 02/07/2011', 'STREET/ADDRESS', 212294, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1421, 1568, 'CLOSED', 'ld/50H12-add 391 Spadina Ave, deleted range 389-391, edit fcode-Tor Prop Map/as per Em', 'STREET/ADDRESS', 214308, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1423, 1570, 'HOLD', 'JF-MM-9-21 Leona Dr, December 23, 2010', 'STREET/ADDRESS', 212345, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1424, 1571, 'IN PROGRESS', 'em-subdiv for former 115 Torbarrie Rd; 224 towns; Feb 8, 2011', 'STREET/ADDRESS', 212356, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1426, 1573, 'CLOSED', 'JF-755 Humberwood Blvd, February 4, 2011', 'STREET/ADDRESS', 214311, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1427, 1575, 'CLOSED', 'JF-MM-1897 Avenue Rd, Brooke Av, October 29, 2010', 'STREET/ADDRESS', 214313, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1428, 1574, 'CLOSED', 'JF-LD-43RNorthumberlandSt-RoofGardenLa, February 3, 2011', 'STREET/ADDRESS', 214312, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (12, 104, 'CLOSED', null, 'STREET/ADDRESS', 213355, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (14, 105, 'CLOSED', null, 'STREET/ADDRESS', 200024, 200222);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (17, 108, 'CLOSED', 'dm- add streets & addrs - Jeanette St, Glenetta St, Vivian Rd, Minerva Ave,Olga St, National St - torlet  Jul 14/08', 'STREET/ADDRESS', 213356, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (33, 126, 'CLOSED', '196 Cassandra Blvd-entr for 145 Brookbanks Dr (Brookbanks Park);Nov 24, 2008', 'STREET/ADDRESS', 200132, 200250);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (35, 128, 'CLOSED', '4095 Old Dundas St, 62A Old Mill Rd, entr for Home Smith Park, main address: 4101 Dundas St W; each address has own roll number;lett Nov 26, 2008;', 'STREET/ADDRESS', 200144, 200251);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (36, 129, 'CLOSED', 'JF/MM-Add addresses 2669 and 2671 Lake Shore Blvd West as per JF-Assmt-2669-2673LakeShoreBlvdW', 'STREET/ADDRESS', 213363, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (41, 135, 'CLOSED', 'em-120 Grangeway Av-assigned, Jan 14, 2009;', 'STREET/ADDRESS', 200196, 200253);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (42, 136, 'CLOSED', 'em-27 Columbus Av , add entr for 25 Columbus Av; Jan 9, 2009;', 'STREET/ADDRESS', 200203, 200243);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (68, 163, 'CLOSED', 'mm 45G Del 3 Vanavery St/IGE2008/FldChkdOct2008', 'STREET/ADDRESS', 213385, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (71, 166, 'CLOSED', 'mm 49K Add 96 Amherst Ave,27Jan2009', 'STREET/ADDRESS', 213388, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (75, 170, 'CLOSED', 'em-159Bermondsey Rd renumber to 155; Jan 28, 2009;', 'STREET/ADDRESS', 213392, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (131, 233, 'CLOSED', 'JF-Jan 14, 2009 - Renumber 24 Charlotte St to 25 Oxley St', 'STREET/ADDRESS', 213433, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (142, 245, 'CLOSED', 'mm Del 6,10 Toba Dr/IGE2008/FldChkd 18Dec2008, and fix loc addr nearby.', 'STREET/ADDRESS', 213444, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (145, 248, 'CLOSED', 'ld/47K-Add missing 122A Northland Ave-SW/Mpac/yelw/parcel', 'STREET/ADDRESS', 213447, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (147, 250, 'CLOSED', 'em-120 Borough Dr; assigned; March 13, 2009;', 'STREET/ADDRESS', 213448, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (151, 254, 'CLOSED', 'dm - fix addrs 1-53, 2-52 Wilcox Creek Ptwy - e-mail 10/19/09', 'STREET/ADDRESS', 213451, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (152, 257, 'HOLD', 'em-pt of 1090 Don Mills Rd; 85-105 The Donway West, 11 Clock Tower Rd; res condo;commer unit; North York lett March 17, 2009;', 'STREET/ADDRESS', 201309, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (164, 276, 'CLOSED', 'mm 48L Split 74 Yore Rd to 74A,74B/YLet-19Mar2009', 'STREET/ADDRESS', 213459, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (174, 287, 'CLOSED', 'mm 49L Fix addr range at Elway Crt/Inhouse', 'STREET/ADDRESS', 213467, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (179, 292, 'HOLD', 'ld/51H- Merge 138 to 160 Jarvis St  to 160-Torlet  1May2007', 'STREET/ADDRESS', 201757, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (219, 332, 'COMPLETED', 'Changed One-way to two-way on Lane first north of St. Clair Avenue West between Prescott Avenue and Blackthorn Avenue', 'STREET/ADDRESS', 202327, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (221, 334, 'CLOSED', 'mm Add 1 Tiago Ave STR to 181 Westview Blvd', 'STREET/ADDRESS', 213496, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (246, 361, 'CLOSED', 'mm 51Q Add 3348M Bayview Ave/NYLet-21Jul2003', 'STREET/ADDRESS', 213514, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (272, 388, 'CLOSED', 'mm-Add 3741,3745,3747,3751 Bloor St W', 'STREET/ADDRESS', 213532, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (273, 389, 'CLOSED', 'add WW E William R Allen N Aldburn, WW E William R Allen S Aldburn - Plan 63R-3352', 'STREET/ADDRESS', 213533, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (278, 395, 'CLOSED', 'em-renumber 20 to 36 Curity Av; add 32 entr for 36 Curity Av; May 25, 2009', 'STREET/ADDRESS', 213538, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (284, 403, 'HOLD', 'em-pt of 620 Dundas ST E; tent 500 Dundas St E; pt of block 14; add 95-97 Regent St; add 35-53 Cole St; May 20, 2009', 'STREET/ADDRESS', 203032, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (285, 404, 'CLOSED', 'JF-LD-Delete 8 Duncan St April 9, 2009', 'STREET/ADDRESS', 213543, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (304, 423, 'CLOSED', 'em-add 1486 Castlefield Av; Woodborough Park; June 10, 2009', 'STREET/ADDRESS', 213557, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (344, 464, 'HOLD', 'em-cofa-437, 439 Martin Grove Rd; Aug 18, 2009', 'STREET/ADDRESS', 203755, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (345, 465, 'IN PROGRESS', 'em-amal 359, 365, 377 Roehampton Av; Aug 17, 2009; 3 blocks towns: 359, 361, 363, 365, 367, 369, 371, 373, 375 Roehampton Av;', 'STREET/ADDRESS', 203755, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (358, 479, 'CLOSED', 'JF-MM-Add 31A and 31B Alcan Avenue, April 23, 2009', 'STREET/ADDRESS', 213593, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (362, 483, 'CLOSED', 'mm-fix loc West Highland Creek at Shepton/Gold Medal Rd', 'STREET/ADDRESS', 213595, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (373, 494, 'HOLD', 'JF-LD-Amalgamate 736-738 Kingston Rd, May 5, 2009.', 'STREET/ADDRESS', 204066, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (374, 496, 'HOLD', 'em-sever 145 Homestead Rd; add 145-155; Aug 24, 09', 'STREET/ADDRESS', 204062, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (375, 497, 'COMPLETED', 'em-sever Morningside Heights; Staines Rd, add Palk La, Tait Crt, Rivitt Pl addresses; Aug 21, 09, renumber 13 to 13B Rivitt Pl-July 22, 2010', 'STREET/ADDRESS', 204062, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (376, 495, 'HOLD', 'em-sever 2819 St Clair Av East; add 2819-2833; Aug 24, 09', 'STREET/ADDRESS', 204062, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (380, 502, 'CLOSED', 'em-add 160-168 Morison Blvd; in blue book; Aug 31, 2009', 'STREET/ADDRESS', 213608, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (508, 631, 'CLOSED', 'Removing one-way segment from Remembrance Dr at Ontario Dr.', 'STREET/ADDRESS', 213713, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (547, 671, 'CLOSED', 'mm-del part Glenholme Pl(road closed)/FireDeptLet-21Oct2009/PhotoMap2009', 'STREET/ADDRESS', 213750, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (550, 674, 'CLOSED', 'Del range addr 7-9 Cameron St-Mpac/FC30Oct09/Lim', 'STREET/ADDRESS', 213752, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (586, 711, 'CLOSED', 'em-add 20 Torham Pl; Nov 24, 09', 'STREET/ADDRESS', 213775, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (587, 712, 'CLOSED', 'em-add 378 Mt. Pleasant Rd; Nov 23, 09', 'STREET/ADDRESS', 213776, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (588, 713, 'CLOSED', 'dm - add Herons Hill Way - reg plan 66M-2471 - Oct 21/09', 'STREET/ADDRESS', 213777, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (593, 718, 'COMPLETED', 'Adding sections of West Humber River Trail for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 205859, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (596, 721, 'CLOSED', 'Adding sections of Monarch Park Trail for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 213783, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (607, 732, 'CLOSED', 'Ld/50K-delete 33 Oriole Pkwy-Not found-FC 12Nov09/Mpac/Propmap/LIM', 'STREET/ADDRESS', 213790, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (609, 734, 'CLOSED', 'LB/50G-Re-add 11 Nelson St(Tor) until construction is completed-ML 19Mar2007/FC14dec09', 'STREET/ADDRESS', 213792, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (610, 735, 'CLOSED', 'Ld/46L-Added 1A & 1B Richview Rd as ENTR to 1-FC 16Nov2009/Mpac', 'STREET/ADDRESS', 213793, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (622, 748, 'HOLD', 'em-split 130 Bloor St W; add 155 Cumberland St (res condo), 130 Bloor St W (remain land, existing commerc); add 153 Cumberland St, retail, Dec 14, 2009 ', 'STREET/ADDRESS', 206021, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (623, 747, 'CLOSED', 'em-cofa add 27 Golfview Av and 58 Corley Av ; Dec 14, 09', 'STREET/ADDRESS', 213798, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (634, 761, 'CLOSED', 'JF-MM-Add 32 High Point Rd, January 4, 2010', 'STREET/ADDRESS', 213804, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (635, 762, 'CLOSED', 'JF-MM-Revise Range addresses, December 23, 2009', 'STREET/ADDRESS', 213805, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (636, 760, 'CLOSED', 'JF-MM-Add 20 Scarsdale Rd, December 23, 2009', 'STREET/ADDRESS', 213803, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (663, 789, 'CLOSED', 'ld/-Del 2198-2200 Danforth Ave-IT-Meena/Mpac/cadastral', 'STREET/ADDRESS', 213827, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (664, 790, 'HOLD', 'em-sever 15 Harding Av (1555 Jane St); Dec 21, 2009; B16/09EYK; ', 'STREET/ADDRESS', 206359, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (720, 846, 'CLOSED', 'mm-Amb stn''s Attrib update/AmbStnsMap-12Feb2010', 'STREET/ADDRESS', 213865, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (726, 852, 'CLOSED', 'mm-extend Grangeway Ave to Bushby Dr/FldChkd-28Oct2008', 'STREET/ADDRESS', 213869, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (739, 866, 'CLOSED', 'Del 141 Galloway Rd(non exist priv segm)/PhotoMap2009', 'STREET/ADDRESS', 213881, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (744, 873, 'HOLD', 'JF-LD-355 Walmer Rd, February 5, 2010', 'STREET/ADDRESS', 207160, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (745, 871, 'CLOSED', 'JF-LD-600JarvisSt-TedRogersWay, December 2, 2009', 'STREET/ADDRESS', 213884, -1);
--commit;
--PROMPT 200 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (746, 872, 'CLOSED', 'ld/51H12-renumbering 620(formerly Jarvis St) Ted Rogers Way to 235 Bloor St E-Torlet 11Dec2001; Jarvis St was renamed to Ted Rogers Way Dec 2, 2009.', 'STREET/ADDRESS', 213885, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (753, 880, 'CLOSED', 'ld/51G-delete Tchc fr 501 Adelaide St E-elections emailed 2Mar10 by Z. Middleton/ apprvd by BS', 'STREET/ADDRESS', 213889, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (789, 917, 'CLOSED', 'em-add 111 George St, entr for 109; March 9, 2010', 'STREET/ADDRESS', 213919, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (800, 928, 'CLOSED', 'em-add 440 Coronation Dr, Manse Road Park, March 17, 2010', 'STREET/ADDRESS', 213926, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (690, 819, 'HOLD', 'ld/50K12-Merge 288 Russell Hill Rd, 262 & 264 St Clair Ave W to 262-Torlet 25Mar2009  --To del later 264 & 288', 'STREET/ADDRESS', 206736, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (699, 825, 'CLOSED', 'ld/50J13-renumber 91A to 91 MacPherson Ave;Expire 91A & 93A-Torlet 1Apr2009.', 'STREET/ADDRESS', 213852, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (734, 861, 'CLOSED', 'dm - flip Smithy Crt -L1-15 to fix parity', 'STREET/ADDRESS', 213877, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (808, 936, 'CLOSED', 'em-add 1-71 Cataraqui Cres , entr for 1 Cataraqui Cres; March 23, 2010', 'STREET/ADDRESS', 213933, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (810, 938, 'CLOSED', 'ld/add ''Names'' to City of Toronto Museums-Emailed 17Mar2009/EDCT -website', 'STREET/ADDRESS', 213935, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (844, 974, 'HOLD', 'JF-DM-151-355 Village Green Square, March 19, 2010', 'STREET/ADDRESS', 207929, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (845, 971, 'HOLD', 'JF-MM-52 Ridley Blvd, February 24, 2010', 'STREET/ADDRESS', 207929, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (846, 972, 'CLOSED', 'JF-LD-155 St Clair Av W, February 25, 2010', 'STREET/ADDRESS', 213960, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (857, 985, 'CLOSED', 'mm-Jim Samuel Lane - fix loc/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213967, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (858, 986, 'CLOSED', 'mm-del Ln E Magnolia N Harmony, Ln E Laurel N Harmony - untravelled/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213968, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (870, 998, 'CLOSED', 'ld/adding fcode and name to 495 Sherbourne St', 'STREET/ADDRESS', 213975, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (874, 1003, 'CLOSED', 'ld/delete name Black Creek Library fr 2141 Jane St-Mpac/Tor Pub Lib/gcc', 'STREET/ADDRESS', 213977, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (876, 1005, 'CLOSED', 'ld/47M-edit 1618-1700 1700 1618 Wilson Ave-Mpac/Tor Pub Lib/google/Gcc-km', 'STREET/ADDRESS', 213978, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (883, 1013, 'CLOSED', 'mm-del Ln E Kingswood N Neville Park-untravelled/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213983, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (912, 1043, 'CLOSED', 'mm-add Ln S Parkhurst W Laird/PhotoMap2009/Cadastral', 'STREET/ADDRESS', 214000, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (913, 1042, 'CLOSED', 'ld/ edit 150 Burrows Hall Bv to Blvd', 'STREET/ADDRESS', 213999, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (914, 1044, 'HOLD', 'JF-98 Park St, March 2, 2010', 'STREET/ADDRESS', 208363, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (915, 1046, 'HOLD', 'JF-53-55AlexisBlvd-56-58McAllisterRd, February 24, 2010 ', 'STREET/ADDRESS', 208363, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (916, 1045, 'HOLD', 'JF-23 Jeavons Av, March 2, 2010', 'STREET/ADDRESS', 208363, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (918, 1049, 'CLOSED', 'JF-755 Morningside Av, February 8, 2010 ', 'STREET/ADDRESS', 214002, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (919, 1048, 'HOLD', 'JF-91 Evans Av, February 8, 2010 ', 'STREET/ADDRESS', 208405, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (920, 1050, 'IN PROGRESS', 'JF-55 Oakfield Dr, February 11, 2010', 'STREET/ADDRESS', 208405, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (928, 1063, 'CLOSED', 'em- to assmt; assign 38A, 44R Huron St; May 3, 2010', 'STREET/ADDRESS', 214007, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (929, 1064, 'HOLD', 'em-revision of 39-51 East Liberty St; new 45 East Liberty St-res condo, 31 Solidarity Way - res condo, 25 Solidarity Way-prop park etc; April 28, 2010', 'STREET/ADDRESS', 208434, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (930, 1060, 'HOLD', 'em-cofa 24 Strathburn Blvd; add 38 Lovilla Blvd; May 5, 2010', 'STREET/ADDRESS', 208434, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (931, 1065, 'HOLD', 'em-170 Fort York Blvd-res condo, 180 entr (commercial); April 29, 2010', 'STREET/ADDRESS', 208434, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (932, 1062, 'CLOSED', 'em-amal 495, 499 into 495 Eastern Av, and 501, 503, 505 into 501 Eastern Av; add 499 entr for 495; del entr 503 and 505 for 501 Eastern Av; April 30, 2010', 'STREET/ADDRESS', 214006, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (933, 1061, 'CLOSED', 'em-renum 4 Twyford Rd to 469 The Kingsway; April 29, 2010', 'STREET/ADDRESS', 214005, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (935, 1067, 'CLOSED', 'mm-del Ln S Kingsbury W Lakeside-untravelled/PhotoMap2009/FldChkd-29Apr2010', 'STREET/ADDRESS', 214009, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (939, 1071, 'CLOSED', 'mm-add Ln N Airdrie E Bayview/PhotoMap2009/Cadastral', 'STREET/ADDRESS', 214013, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (972, 1104, 'CLOSED', 'em-division of 13; add 13A Corbett Av; May 26, 2010', 'STREET/ADDRESS', 214036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (975, 1107, 'CLOSED', 'em-to assmt, range 67-81 Livingston Rd; add 69, 77, 79 entr; May 21, 2010', 'STREET/ADDRESS', 214039, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (988, 1120, 'HOLD', 'JF-50 Red Deer Av, June 3, 2010', 'STREET/ADDRESS', 208940, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1011, 1144, 'HOLD', 'JF-2787 and 2787R Victoria Park Av  - Leafield Dr, April 20, 2010 and June 18, 2010', 'STREET/ADDRESS', 209146, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1026, 1159, 'IN PROGRESS', 'Changing one-way on Dundas Square from Yonge Street and a point 60.5 metres east', 'STREET/ADDRESS', 209236, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1027, 1158, 'CLOSED', 'em-sever 2525 St Clair Av W; add 2471 St Clair Av W; June 21, 2010; B19/06EYK; ', 'STREET/ADDRESS', 214061, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1032, 1165, 'IN PROGRESS', 'Changing one-way on Essex Street from a point 73.2 metres west of Christie Street and Ossington Avenue', 'STREET/ADDRESS', 209264, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1047, 1182, 'CLOSED', 'em-add 1A Sand Beach Rd, city-owned; June 17, 2010', 'STREET/ADDRESS', 214070, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1048, 1184, 'CLOSED', 'em-add 2441 Lake Shore Blvd West, (Amos Waites Park), 2 Sand Beach Rd (Sand Beach Rd Parkette), June 17, 2010', 'STREET/ADDRESS', 214072, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1049, 1183, 'CLOSED', 'em-add 1 Twelfth St, Twelfth St Parkette, June 18, 2010', 'STREET/ADDRESS', 214071, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1050, 1185, 'CLOSED', 'em-add 1A, 41, 123 Lake Promenade, Twenty Third, Twenty Fifth, Twenty Eighth St Parkette, June 15, 2010', 'STREET/ADDRESS', 214073, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1053, 1188, 'IN PROGRESS', 'Changing one-way on Lewis Street from a point 30.5 metres north of Eastern Avenue and Queen Street East', 'STREET/ADDRESS', 209341, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1060, 1198, 'IN PROGRESS', 'Marlborough Avenue Marlborough Place and a point 310.0 metres west of the west street line of Yonge Street', 'STREET/ADDRESS', 209393, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1066, 1204, 'CLOSED', 'ld-54G-delete 54 Balsam Ave-FC 29june2010/LIM', 'STREET/ADDRESS', 214077, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1067, 1206, 'HOLD', 'JF-51 Milton St, November 10, 2009.', 'STREET/ADDRESS', 209446, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1078, 1217, 'CLOSED', '51N11- re-adding (temp STR) 160 Old Yonge St-SW/FC6July10/NYlet 31Jan2008', 'STREET/ADDRESS', 214082, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1080, 1219, 'IN PROGRESS', 'Changing one-way on Sterling Road from Bloor Street West and a point 33 metres north of Perth Avenue', 'STREET/ADDRESS', 209504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1101, 1241, 'IN PROGRESS', 'Adding one-way on Munro Street from Kintyre Avenue and Dundas Street East', 'STREET/ADDRESS', 209661, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1105, 1246, 'HOLD', 'JF-58-62 HillaryAv, June 1, 2010', 'STREET/ADDRESS', 209721, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1106, 1245, 'HOLD', 'JF-122 Simpson Av, October 9, 2009', 'STREET/ADDRESS', 209721, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1107, 1247, 'HOLD', 'JF-32 Jeavons Av, June 8, 2010', 'STREET/ADDRESS', 209721, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1114, 1254, 'CLOSED', null, 'STREET/ADDRESS', 213344, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1117, 1257, 'CLOSED', 'mm-Government Rd fix loc at Royal York Rd/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213350, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1155, 1296, 'CLOSED', 'Ld-51G-Edit linears Scott Lanes, Farhuqars Lane - imagery/cadastral', 'STREET/ADDRESS', 214117, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1169, 1310, 'CLOSED', 'mm-add 143 Vanauley Walk/LIM', 'STREET/ADDRESS', 214128, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1197, 1339, 'IN PROGRESS', 'Adding Rouge Park Trails for Toronto EMS and the Rouge Park ', 'STREET/ADDRESS', 210422, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1206, 1351, 'CLOSED', 'em-change 1-97 Ellesmere Rd to 85; Parkway Mall; Sept 2, 2010', 'STREET/ADDRESS', 214151, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1207, 1348, 'CLOSED', 'em-add 2 Lorne Av, entr for 212 Park Lawn Rd; Sept 2, 2010', 'STREET/ADDRESS', 214149, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1208, 1349, 'CLOSED', 'em-change 74-80 Sheppard Av W to 80; add 76 entr; Sept 2, 2010', 'STREET/ADDRESS', 214150, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1210, 1352, 'CLOSED', 'dm - to close walkway - WWN Hartsville W Broadbridge - by-law 976-2010', 'STREET/ADDRESS', 214152, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1223, 1367, 'CLOSED', 'ld/ 52H- To add name Bruce Mackey Park to 55 Wadell St-Tor city parknames/ police/BS', 'STREET/ADDRESS', 214158, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1236, 1380, 'HOLD', 'em-amal 2 rolls for Black Creek Site West, 805 Jane St; Sept 21, 10', 'STREET/ADDRESS', 210736, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1261, 1405, 'CLOSED', 'mm-add temp stub Montoro Lane/By -Law 927-2010', 'STREET/ADDRESS', 214186, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1273, 1417, 'CLOSED', 'ld/fix ctrl & intersections of Laneways:Ln W& E Bathurst S Bloor; Croft St, Ln W Lippincott N Lennox', 'STREET/ADDRESS', 214198, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1303, 1450, 'CLOSED', 'mm-Sexton Cres fix addrs loc/Cadastral', 'STREET/ADDRESS', 214223, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1537, 1686, 'IN PROGRESS', null, 'STREET/ADDRESS', 213315, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (16, 107, 'IN PROGRESS', 'em-sever 55 Oakfield Dr; Dec 12, 2008;', 'STREET/ADDRESS', 200037, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (22, 113, 'CLOSED', null, 'STREET/ADDRESS', 200066, 200109);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (32, 125, 'CLOSED', 'Add 17 19 Edhouse Ave & 17 19 Belanger Cres-SC let 22July2008', 'STREET/ADDRESS', 213361, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (37, 131, 'HOLD', 'OMB (Oct 29, 2008), sever 185 Yorkland Blvd (195 Yorkland Blvd-new); lett Dec 15, 2008', 'STREET/ADDRESS', 200149, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (39, 133, 'HOLD', 'ld-sever 250 Red[path Ave to 260 to 264-Tltr 27Nov2008', 'STREET/ADDRESS', 200186, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (46, 140, 'CLOSED', 'JF-15 Milford Avenue- Add and revise addresses', 'STREET/ADDRESS', 213366, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (48, 142, 'CLOSED', 'Delete 13A Jillson Av ', 'STREET/ADDRESS', 213368, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (104, 205, 'IN PROGRESS', 'em-2992-3014 Bayview Av, 401, 405 Kingsdale Av, 436, 440 Empress AV;Feb 12, 2009;', 'STREET/ADDRESS', 200568, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (107, 208, 'CLOSED', 'em-add 177A Langford Av; Feb 18, 2009', 'STREET/ADDRESS', 213415, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (114, 215, 'CLOSED', 'digitize cycle paths - Feb 2009', 'STREET/ADDRESS', 213421, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (121, 223, 'IN PROGRESS', 'Overpass underpass Maintenance', 'STREET/ADDRESS', 200774, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (128, 230, 'CLOSED', 'mm 49K Move 496 to 514 Vaughan Rd(fix loc)/Cadastral/MPAC', 'STREET/ADDRESS', 213431, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (154, 258, 'CLOSED', 'JF add 26 Gunns Rd as LE for 69 Symes Rd', 'STREET/ADDRESS', 213453, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (160, 272, 'CLOSED', 'em-add 45R, 49R, 51R and 57R Park Hill Rd;March 18, 2009;', 'STREET/ADDRESS', 213456, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (163, 275, 'CLOSED', 'JF-Add 74A, 74B Yore Rd ', 'STREET/ADDRESS', 213458, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (202, 315, 'CLOSED', 'em-renumber 18A Benlamond Av to 18 1/2 Benlamond Av; April 2, 2009', 'STREET/ADDRESS', 213482, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (204, 317, 'CLOSED', null, 'STREET/ADDRESS', 213484, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (227, 340, 'CLOSED', 'mm- add 3601,3700 Eglinton Ave W/FldChkd-16Apr2009', 'STREET/ADDRESS', 213501, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (229, 342, 'COMPLETED', 'Added one-way to Concord Avenue from lane first south of Bloor Street West to Bloor Street West', 'STREET/ADDRESS', 202412, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (267, 383, 'CLOSED', 'ld/edit 1 to 21 Cole St to SE-Torlet 1May2009/2Nov2007/em', 'STREET/ADDRESS', 213529, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (276, 392, 'CLOSED', 'ld/Add LFN York University Busway and rename segments-CT staff report 18June2007/BS emailed 5May2009', 'STREET/ADDRESS', 213536, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (277, 394, 'CLOSED', 'No barrier created in this control task; The ''No Connectivity'' & ''No Turn'' will be performed by LIT', 'STREET/ADDRESS', 213537, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (282, 401, 'HOLD', 'em-renumber 30 Regent St to 40 (childcare centre); add 42-68 Regent St and 37-63 Arnold Av (townhouses); May 20, 2009', 'STREET/ADDRESS', 203023, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (301, 420, 'CLOSED', 'em-add 4954 Yonge St. entrance for 4990 Yonge St; June 5, 2009', 'STREET/ADDRESS', 213554, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (334, 454, 'CLOSED', 'ld/55k13-renumber 8 Winkler Ter to 6A-SCLetr 16Aug2007', 'STREET/ADDRESS', 213581, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (350, 470, 'CLOSED', 'JF MM Add 600 Queen Plate Drive, April 16, 2009', 'STREET/ADDRESS', 213587, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (364, 485, 'CLOSED', 'em-add entr 132-172 Bennett Rd; Bennett Plaza, prime 138 Bennett Rd; assigned by former Scarborough; Aug 26, 09', 'STREET/ADDRESS', 213597, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (366, 487, 'CLOSED', 'em-add 801-817 Brimley Rd, entr for 799 Brimley Rd; shopping mall, assigned by former Scarborough; Aug 27, 2009', 'STREET/ADDRESS', 213598, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (367, 488, 'CLOSED', 'Ld/Add 88A Foch Ave-Bins/Mpac/FC25Aug09/apset/em to attach ML', 'STREET/ADDRESS', 213599, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (369, 490, 'CLOSED', 'em-77 Canterbury Pl (MPAC) Aug 27, 2009', 'STREET/ADDRESS', 213601, -1);
--commit;
--PROMPT 300 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (377, 498, 'CLOSED', 'ld/50G-extend Lower Simcoe St from Bremner Blvd to Front St W-FC24aug09/BH17Aug09/Apset', 'STREET/ADDRESS', 213605, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (388, 506, 'CLOSED', 'ld/del 7 Simcoe St-Torlet 28Aug2009', 'STREET/ADDRESS', 213611, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (438, 561, 'CLOSED', 'ld/move 425 Old Weston Rd', 'STREET/ADDRESS', 213658, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (441, 564, 'CLOSED', 'mm-Modify parks name to Joyce Trimmer Park located at 8450 Sheppard Ave E', 'STREET/ADDRESS', 213661, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (444, 567, 'CLOSED', null, 'STREET/ADDRESS', 213664, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (467, 590, 'CLOSED', 'mm- 32 to 44 Freshmeadow Dr fix addr loc/NYRefMap/PhotoImagery', 'STREET/ADDRESS', 213684, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (480, 603, 'HOLD', 'em-add 21-45, 22-50 St Magnus Dr, Oct 5, 2009', 'STREET/ADDRESS', 204917, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (495, 618, 'CLOSED', 'mm-fix addrs loc at Leslie St/Wild Briar/NYRefMap/Photoimagery', 'STREET/ADDRESS', 213701, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (527, 654, 'CLOSED', null, 'STREET/ADDRESS', 213732, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (552, 677, 'CLOSED', 'mm-add 120,130 George Henry Blvd(STR to 120-130)/NYRefMap/F.chkd-2Nov2009', 'STREET/ADDRESS', 213754, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (553, 676, 'CLOSED', 'no action done', 'STREET/ADDRESS', 205429, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (559, 684, 'CLOSED', null, 'STREET/ADDRESS', 213758, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (570, 693, 'CLOSED', 'em-renum 13 Pythagoras Dr to 11A, renum 13 Archimedes Crt to 11A; Nov 10, 09', 'STREET/ADDRESS', 213766, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (571, 691, 'CLOSED', 'em-add 231-247 Wallace Av; industr units; Nov 10, 09', 'STREET/ADDRESS', 213764, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (572, 694, 'HOLD', 'em-renumber 742 Scarlett Rd to 2 Yorkleigh Av; Nov 10, 09. JF- Return 742 Scarlett Rd in connection with proposed severance, August 23, 2010', 'STREET/ADDRESS', 205504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (573, 695, 'HOLD', 'em-add 2952A, B, 2954A, B, 2956A, B, 2958A, B, 2960A, B, Bayview Av, 399 Hillcrest Av, freeholds, Nov 10, 09', 'STREET/ADDRESS', 205504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (574, 690, 'HOLD', 'em-add 133A, 133B Harding Blvd; Nov 9, 09; CofA;', 'STREET/ADDRESS', 205504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (576, 701, 'HOLD', 'em-add 18A, 18B Sherwood Av; OMB Feb 20, 09; Nov 17, 09', 'STREET/ADDRESS', 205597, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (578, 703, 'CLOSED', 'dm- move 107 Wilton St / MPAC Nov 19/09', 'STREET/ADDRESS', 213771, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (590, 715, 'CLOSED', 'dm - creating linear name - Ted Rogers Way - to modify section of Jarvis St south of Bloor St - Aug 11/09', 'STREET/ADDRESS', 213779, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (603, 728, 'CLOSED', 'Ld- Add 21R Pretoria Ave', 'STREET/ADDRESS', 213787, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (606, 731, 'CLOSED', 'em-add 8A Aggie Hogg Gardens, entr for 1090 Don Mills Rd (shops on Don Mills); Dec 11, 09', 'STREET/ADDRESS', 213789, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (708, 834, 'CLOSED', 'dm - moving addrs - Oates Dr/ Dairy Dr - torlet Jul 15/08', 'STREET/ADDRESS', 213858, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (733, 860, 'CLOSED', 'ld/45P-added name Carmine Stefano CC to 3100 Weston Rd', 'STREET/ADDRESS', 213876, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (756, 883, 'CLOSED', 'mm-Merge Ln N The Queensway E Holbrooke(5 arcs)/PropDataMap/PhotoMap2009', 'STREET/ADDRESS', 213891, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (757, 884, 'CLOSED', 'ld/51H-Torlet 2Dec09- renumber 777(formerly Jarvis St)Ted Rogers Way to #1; del also 617- Jarvis St was renamed to Ted Rogers Way 2Dec09.', 'STREET/ADDRESS', 213892, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (775, 902, 'CLOSED', 'ld/ renumber 16 Shaver Ave S to 37 Greenfield Dr-Torlet 18June2009 for JF', 'STREET/ADDRESS', 213907, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (793, 921, 'CLOSED', 'mm-del Ln E Davenport S Blackmore/By-Law 485-2008', 'STREET/ADDRESS', 213923, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (794, 922, 'CLOSED', 'em-add 4891A Yonge St, entr for 4891; March 9, 2010', 'STREET/ADDRESS', 213924, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (831, 959, 'CLOSED', 'em-renum 31 to 33 Beverly Hills Dr; March 26, 2010', 'STREET/ADDRESS', 213952, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (838, 969, 'CLOSED', 'em-amal 10 and 16 Avondale Rd into 10 Avondale Rd; April 7, 2010', 'STREET/ADDRESS', 213958, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (839, 968, 'HOLD', 'em-c of a 1001 Queen St W, B0073/09TEY; add 1033 Queen St W (commerc), 100 Freedom St (resid); April 7, 2010', 'STREET/ADDRESS', 207920, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (840, 967, 'HOLD', 'em-amal 152, 154, 156 Park Lawn Rd, into 154; Tim Hortons, April 7, 2010', 'STREET/ADDRESS', 207920, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (889, 1019, 'CLOSED', '56M-edit Highland Creek(geoid 109726)  to West Highland Creek-iMaint cadastral/GCC-CM', 'STREET/ADDRESS', 213986, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (899, 1029, 'CLOSED', 'ld/ - Waiting for GCC to fix -Problem w/ iMaint- editing Linear Name Type Close(CS) to (Close)', 'STREET/ADDRESS', 213991, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (900, 1030, 'HOLD', 'em-amal 2388-2390-2392-2398 Lake Shore Blvd W and 13 Superior Av; res condo: 11 Superior Av; retail 2398 Lake Shore Blvd W; April 23, 10', 'STREET/ADDRESS', 208268, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (901, 1031, 'HOLD', 'em-400 Wellington Av W-res condo; retail: 404, 408, 412 Wellington Av W; April 23, 2010', 'STREET/ADDRESS', 208268, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1545, 1694, 'IN PROGRESS', null, 'STREET/ADDRESS', 214397, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (702, 828, 'HOLD', 'em-cofa 68, 70 Niagara St; Feb 9, 2010', 'STREET/ADDRESS', 206810, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (721, 850, 'HOLD', 'JF-DM 1FaircrestCircle January 7, 2010-02-18', 'STREET/ADDRESS', 206981, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (722, 849, 'HOLD', 'JF-LD 506 College St, September 3, 2009', 'STREET/ADDRESS', 206981, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (723, 848, 'CLOSED', 'JF-DM - 36 Trudelle St, February 11, 2010-02-18', 'STREET/ADDRESS', 213867, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (724, 847, 'CLOSED', 'JF-DM-3105 Sheppard Av E, February 12, 2010', 'STREET/ADDRESS', 213866, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (743, 870, 'CLOSED', 'mm-del 1041 Birchmount Rd-not exist street/PropDataMap/PhotoMap2009/FldChkd-2Mar2010', 'STREET/ADDRESS', 213883, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (788, 916, 'HOLD', 'em-prop city-owned res bldg 150 Dan Leckie Way, incl podiums, retail, towns; March 9, 2010', 'STREET/ADDRESS', 207547, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (835, 963, 'CLOSED', 'mm-modify Ln E Bathurst S Wolseley to Ace Lane/TorontoMap/Cadastral', 'STREET/ADDRESS', 213955, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (863, 991, 'HOLD', 'em-cofa add 8, 10 Chichester Pl, B062/09SC, April 6, 2010', 'STREET/ADDRESS', 208056, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (868, 996, 'CLOSED', 'mm-del Ln N Queen W Neville Park-untravelled/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213973, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (938, 1070, 'CLOSED', 'mm-modified Subway Line to Bloor-Danforth Subway(W of Victoria Park Ave)/Inhouse', 'STREET/ADDRESS', 214012, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1002, 1134, 'CLOSED', '48K-adding Ln W Failsworth S Aileen-Tech Serv D&C-EtobYK/Apset', 'STREET/ADDRESS', 214053, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1015, 1147, 'IN PROGRESS', 'Changing one-way on Bishop Tuto Blvd a point 78 metres north of Queens Quay West and Stadium Road', 'STREET/ADDRESS', 209170, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1020, 1152, 'CLOSED', 'Changing one-way on Clinton Street from a point 61 metres north of Bloor Street West and Barton Avenue; Changing one-way on Clinton Street from a point 107 metres north of College Street and Bloor Street West', 'STREET/ADDRESS', 214059, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1023, 1155, 'IN PROGRESS', 'Changing one-way on Cumberland Street from a point 61.0 metres east of Bay Street and Yonge Street', 'STREET/ADDRESS', 209218, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1057, 1194, 'HOLD', 'em-amal 423, 425, 427 Dundas St E, new 425; res devel; June 25, 2010', 'STREET/ADDRESS', 209366, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1058, 1195, 'CLOSED', 'em-renum 322 Broadway Av to 71 Cardiff Rd; June 28, 2010', 'STREET/ADDRESS', 214074, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1059, 1196, 'IN PROGRESS', 'Changing one-way on Major Street from a point 50 metres north of College Street and Ulster Street', 'STREET/ADDRESS', 209367, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1073, 1212, 'IN PROGRESS', 'Changing one-way on Scollard Street from Hazelton Avenue and a point 89.5 metres west of Bay Street', 'STREET/ADDRESS', 209468, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1095, 1235, 'CLOSED', '47J21- To re-add 6 Winfield Ave(temp)until severance is completed-YKlet 19Dec2007/SW 12Jul2010', 'STREET/ADDRESS', 214091, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1109, 1249, 'CLOSED', null, 'STREET/ADDRESS', 209775, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1112, 1252, 'CLOSED', 'mm-Redlea Ave at Steeles Ave - fix loc/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213348, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1115, 1255, 'HOLD', 'JF-218 Holmes Av, July 12, 2010', 'STREET/ADDRESS', 209823, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1116, 1256, 'HOLD', 'JF-18YorkSt-120BremnerBlvd, July 9, 2010', 'STREET/ADDRESS', 209823, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1136, 1276, 'CLOSED', 'Ld-50J-103R Cotttingham St-Mpac', 'STREET/ADDRESS', 214103, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1152, 1293, 'CLOSED', 'dm - adding long term care facility names - e-mail ltr 08/12/10', 'STREET/ADDRESS', 214115, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1159, 1300, 'CLOSED', 'mm-modify Colonel Sam Smith Park Trl to Ln W Thirteenth  S Lake Shore/Cadastral/StNaming-BH', 'STREET/ADDRESS', 214120, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1160, 1301, 'CLOSED', 'mm-modify st name from Mc Murrich St to McMurrich St/By-Law No1319 dated 27/03/1883', 'STREET/ADDRESS', 214121, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1166, 1307, 'HOLD', 'em-add 15-39 Montoro Lane, pt of 4274 Kingston Rd and 165, 171, 175, 177 Galloway Rd; Aug 13, 2010', 'STREET/ADDRESS', 210186, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1170, 1311, 'CLOSED', 'em-assmt, range 910-916 Sheppard Av W; Aug 16, 2010', 'STREET/ADDRESS', 214129, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1171, 1312, 'CLOSED', 'em-add 160 Memorial Park Av; True Davidson Park; Aug 16, 2010', 'STREET/ADDRESS', 214130, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1176, 1317, 'CLOSED', 'mm-Chesterton Shores modify jurisd and f.code  to private, laneway/Cadastral', 'STREET/ADDRESS', 214239, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1177, 1318, 'CLOSED', 'ld-editing linears on Yonge/ Queen/ Jarvis/ Wellington', 'STREET/ADDRESS', 214240, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1178, 1319, 'CLOSED', 'mm-modify Trinity St f.code, jurisd/Cadastral/PhotoMap2010', 'STREET/ADDRESS', 214133, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1204, 1346, 'HOLD', 'em-cofa for 89 Twenty Second St, add 87; Sept 8, 2010', 'STREET/ADDRESS', 210528, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1224, 1368, 'CLOSED', 'ld/added Allan A Lamport Stadium to 1155 King St W-gcc/km, online site', 'STREET/ADDRESS', 214159, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1249, 1393, 'CLOSED', 'em-add 160 Orton Park Rd, Sept 23, 2010', 'STREET/ADDRESS', 214178, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1250, 1394, 'HOLD', 'em-cofa for 4694-4696 Kingston Rd; Oct 5, 2010', 'STREET/ADDRESS', 210824, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1259, 1404, 'CLOSED', null, 'STREET/ADDRESS', 210911, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1260, 1403, 'CLOSED', 'mm-3 Hanover Rd add parks name-Robert Leek Park/TOMediaRelations Let-Sep 24,2010', 'STREET/ADDRESS', 214185, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1262, 1406, 'CLOSED', 'dm -by-law to assume munic services roads and laneways within reg Plan 66M -2386/ Wallace Ave & Rankin Ave.', 'STREET/ADDRESS', 214187, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1269, 1413, 'CLOSED', 'em-add 455 Kipling Av; Oct 18, 2010', 'STREET/ADDRESS', 214194, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1271, 1416, 'CLOSED', 'em- to assmt 136-152 Perth Av; Oct 20, 2010', 'STREET/ADDRESS', 214197, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1272, 1415, 'CLOSED', 'em-to assmt 1573-1575 Eglinton Av W; Oct 19, 2010', 'STREET/ADDRESS', 214196, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1276, 1420, 'IN PROGRESS', 'Adding Bikeway Stairs', 'STREET/ADDRESS', 211041, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1284, 1429, 'CLOSED', 'ld/48G-Delete range addr not in Mpac-50-54, 58-64, 54-60 & 54A-60 Elm Grove Ave(indv pts. 50 to 78 exist in OAR) & fix addr on Elm Grove & Gwynne Ave- dup_range_addr_25/gcc/cadstral', 'STREET/ADDRESS', 214208, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1302, 1449, 'CLOSED', 'dm -delete 833 address name - Charles Hansen Canadian Laboratory - e-mail ltr Nov 15/10', 'STREET/ADDRESS', 214222, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1309, 1456, 'CLOSED', 'ld-fix laneways Jackson Pl, Anne Rawson Lane, Ln W Yonge S Melrose', 'STREET/ADDRESS', 214228, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1313, 1460, 'CLOSED', 'ld/50H11-add 117 to 123 161 173 & 175 Vanauley Walk, 136 & 138 Grange Crt-Mpac/LIM/dup_range_addr Oct2010', 'STREET/ADDRESS', 214232, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1315, 1462, 'CLOSED', 'ld/49Q-del range addr 1025-1067, 1069-1079 Steele Ave W duplct to 1025-1085 Steeles Ave W-MPAC/dup_range_addr_act_25rply', 'STREET/ADDRESS', 214234, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1320, 1467, 'CLOSED', 'dm - fix address range - 31 to 85 Gilder Dr - e-mail ltr 10/19/2010', 'STREET/ADDRESS', 214241, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1324, 1471, 'CLOSED', 'ld/49M-deleted ranged 53-61 & 63-77 Flemington Rd/GCC dup_range_addr_ act_25rply;/Mpac', 'STREET/ADDRESS', 214243, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1342, 1489, 'CLOSED', 'ld/54H23-move loc 2213 to 2219 Gerrard St W-29Oct2008', 'STREET/ADDRESS', 214258, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1343, 1490, 'CLOSED', 'ld/56K-add 53 Vivian Rd-Solid Waste/Bin/EM/Mpac', 'STREET/ADDRESS', 214259, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1344, 1491, 'HOLD', 'em-amal 1193 The Queensway and 7, 11 and pt of 45 Zorra St; new 1185 -res condo; Dec 16, 2010', 'STREET/ADDRESS', 211648, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1352, 1499, 'CLOSED', 'dm - add 36 Red Fox Pl / delete 44 - SC ltr Jul 10/07', 'STREET/ADDRESS', 214265, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1353, 1500, 'CLOSED', 'em-renumber 4 1/2 to 4 Draper St; Jan 5, 2011', 'STREET/ADDRESS', 214266, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1358, 1505, 'CLOSED', 'em-add 462 Guildwood Parkway; Jan 6, 2011', 'STREET/ADDRESS', 214270, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1378, 1525, 'CLOSED', '51J-Deleted ranged addr 418-424 Summerhill Ave-not in mpac/amalik', 'STREET/ADDRESS', 214281, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1380, 1527, 'COMPLETED', 'JF-DM-1730 NeilsonRd , 2710,2750 Morningside Rd, July 9, 2010', 'STREET/ADDRESS', 211892, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1389, 1536, 'HOLD', 'em-amal 326, 358 King St W, split : 330, 350 King St W, 80 John St, 5 Widmer St; Jan 18, 2011', 'STREET/ADDRESS', 212027, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1390, 1537, 'IN PROGRESS', 'Moving Lake Ontario shoreline to match lake filing at Port Union Rd', 'STREET/ADDRESS', 212030, -1);
--commit;
--PROMPT 400 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1391, 1539, 'CLOSED', 'em-add 4910 Sheppard Av E , entr for 4900; Jan 17, 2011', 'STREET/ADDRESS', 214289, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1392, 1538, 'CLOSED', 'em-add 795 Dundas St W, entr for 793; Jan 17, 2011', 'STREET/ADDRESS', 214288, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (26, 118, 'CLOSED', 'JF-369StJohnsRd-WindermereAv', 'STREET/ADDRESS', 213359, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (43, 137, 'CLOSED', 'em-15B Mulock Av renumbered from 15 Mulock Av; confirm 40 Cawthra Av; lett Jan 9, 2009;', 'STREET/ADDRESS', 200207, 200242);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (44, 138, 'CLOSED', 'Testing site area error', 'STREET/ADDRESS', 200383, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (80, 176, 'CLOSED', 'ld/51G-move 105 George St-Mapc/em', 'STREET/ADDRESS', 213397, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (81, 177, 'CLOSED', 'mm Del Ln S Queen W Portland/By-Law1116-2008', 'STREET/ADDRESS', 213398, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (82, 178, 'CLOSED', null, 'STREET/ADDRESS', 201582, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (91, 189, 'CLOSED', 'dm - adding temporary stub and end-of -range addrs - Glenetta St', 'STREET/ADDRESS', 213404, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (105, 206, 'HOLD', 'em-101-127 Zaph Av, Pythagoras Dr, Archimedes Crt; Feb 12, 2009;', 'STREET/ADDRESS', 200583, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (119, 220, 'CLOSED', 'dm- 58Q- moving 56 to 166 Hummingbird Dr to correct parcels -ltr Dec12/07', 'STREET/ADDRESS', 213425, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (122, 224, 'CLOSED', '52N  Fix loc 5 to 33 Northey Dr/MPAC/NYRefMap', 'STREET/ADDRESS', 213427, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (134, 236, 'CLOSED', 'ld/52H-Del range addr 10-20 Boultbee Ave-Mpac/policy&plan req', 'STREET/ADDRESS', 213436, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (167, 280, 'HOLD', 'JF - Add 547 and move 545 Morrish Rd ', 'STREET/ADDRESS', 201608, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (173, 286, 'CLOSED', 'em- add 503 Marlee Av , entr for 501 Marlee Av; March 24, 2009;', 'STREET/ADDRESS', 213466, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (175, 288, 'CLOSED', 'em-add 87A Foch Av; division of 87 Foch Av; March 26, 2009;', 'STREET/ADDRESS', 213468, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (180, 293, 'HOLD', 'em-cofa 92 Mason Rd, add 175 Adanac Dr;March 24, 2009;', 'STREET/ADDRESS', 201762, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (184, 297, 'CLOSED', 'mm 46H 104 Waniska Ave(fix loc)/IGE2008/Fld Chkd 30Mar2009', 'STREET/ADDRESS', 213471, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (186, 301, 'CLOSED', 'em-4 Miles Rd Miles Road End Parkette March 27, 2009', 'STREET/ADDRESS', 213475, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (187, 300, 'CLOSED', 'em-20 Bisset Av Bisset Park March 27, 2009', 'STREET/ADDRESS', 213474, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (188, 299, 'CLOSED', 'em-94 Superior Av Queens Park March 27, 2009', 'STREET/ADDRESS', 213473, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (198, 311, 'CLOSED', 'JF - Record 442-482 McNicollAv as SE for 440 McNicollAv', 'STREET/ADDRESS', 213479, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (208, 321, 'CLOSED', 'mm-add 43A Lavender Rd/MPAC/Photomagery', 'STREET/ADDRESS', 213486, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (249, 363, 'CLOSED', 'em-add 20A Shank St; entr for 891 Adealide St W; May 4, 2009', 'STREET/ADDRESS', 213516, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (250, 365, 'CLOSED', 'em-add 18 Franklin Av; division of 20 Franklin Av; May 4, 2009', 'STREET/ADDRESS', 213517, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (251, 366, 'CLOSED', 'em-renumber 114 Horsham Av to 116 Horsham Av; May 4, 2009', 'STREET/ADDRESS', 213518, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (252, 364, 'HOLD', 'em-add 16 Lower Jarvis St (commerc condo), 3 Market St (low-rise res bldg) pt of 18 Lower Jarvis St; May 4, 2009', 'STREET/ADDRESS', 202620, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (261, 376, 'CLOSED', '58Q Steeles Ave E/Staines Rd fix centreline intersection/Inhouse', 'STREET/ADDRESS', 213525, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (281, 398, 'CLOSED', 'JF-MM-Add 38 Valecrest Dr May 5, 2009', 'STREET/ADDRESS', 213541, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (283, 402, 'CLOSED', 'ld/move 110 Yorkville Ave into parcel-zdyokic/mpac', 'STREET/ADDRESS', 213542, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (289, 408, 'CLOSED', 'dm - adding 3660 Kingston Rd (Sears outlet) - field check May 27/09', 'STREET/ADDRESS', 213547, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (310, 430, 'CLOSED', 'Ld/Sever 345 Carlaw Ave to 345 & 349,& 1200 Dundas St E as SE to 345-JF-CPR 16Jun09', 'STREET/ADDRESS', 213562, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (381, 503, 'CLOSED', 'JF-LD-Add 1590 Yonge St, May 5, 2009', 'STREET/ADDRESS', 213609, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (456, 579, 'CLOSED', 'em-add 1532A Dundas St W, entr for 1532; Sept 21, 09', 'STREET/ADDRESS', 213674, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (457, 580, 'CLOSED', 'mm-Del non-existing addr/Fld Chkd 4Sep2009', 'STREET/ADDRESS', 213675, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (458, 581, 'CLOSED', null, 'STREET/ADDRESS', 213676, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (460, 583, 'CLOSED', 'dm - adding 107 to 155 purpledusk Trl ENTR Sep 24/09', 'STREET/ADDRESS', 213678, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (471, 594, 'IN PROGRESS', 'JF-DM-Adjust address status and location, March 6, 2009', 'STREET/ADDRESS', 204813, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (472, 595, 'HOLD', 'JF-Add 5,25,35 Richgrove Dr, March 11, 2009 and 610,620 Martin Grove Rd, May 28, 2010', 'STREET/ADDRESS', 204813, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (481, 604, 'CLOSED', 'Add 228 & 230 Woodsworth Rd - Yk ref map/mpac', 'STREET/ADDRESS', 213691, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (486, 609, 'CLOSED', 'mm-Finch Ave E at Leslie-fix addr loc/NYRefMap/PhotoImagery', 'STREET/ADDRESS', 213696, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (512, 638, 'CLOSED', 'em-add 2475 Dufferin St, entr for 2473; Oct 15, 2009', 'STREET/ADDRESS', 213719, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (513, 635, 'CLOSED', 'em-add 2491 Dufferin St, entr for 2489; Oct 15, 2009', 'STREET/ADDRESS', 213716, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (514, 636, 'CLOSED', 'em-add 1631, 1633A Eglinton Av W, entr for 1633; Oct 15, 09', 'STREET/ADDRESS', 213717, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (515, 637, 'CLOSED', 'em-add 2483 Dufferin St, entr for 2481; Oct 15, 09', 'STREET/ADDRESS', 213718, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (526, 650, 'CLOSED', 'mm-400 Linkwood Lane-fix loc/MPAC/RefMap', 'STREET/ADDRESS', 213728, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (546, 670, 'CLOSED', 'dm - add 20, 30 ENTR to 20-30 Aurora Crt  -Oct 29/09', 'STREET/ADDRESS', 213749, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (548, 672, 'CLOSED', 'mm-Modify Ln E Yonge S Eglinton to Cowbell Lane/StNamingLet-29Oct2009', 'STREET/ADDRESS', 213751, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (560, 685, 'CLOSED', 'mm-add 163 Sammon Ave,fix loc 161/ETRefMap/MPAC', 'STREET/ADDRESS', 213759, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (594, 719, 'CLOSED', 'Adding sections of North Park Trail for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 213781, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (598, 725, 'HOLD', 'JF-MM-Add 366 Caledonia Rd, August 4, 2009', 'STREET/ADDRESS', 205882, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (599, 723, 'HOLD', 'JF-MM-Add 1761 Sheppard Av E, August 19, 2009', 'STREET/ADDRESS', 205882, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (600, 724, 'HOLD', 'JF-MM Add 1751 Sheppard Av E, August 19, 2009', 'STREET/ADDRESS', 205882, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (630, 755, 'IN PROGRESS', 'Renaming West Humber River Trail to West Humber Trail ', 'STREET/ADDRESS', 206082, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (631, 757, 'CLOSED', 'ld/49J22-Add 5 Greensides Ave as STR to 160 Tyrrel Ave-ML7Jan2010', 'STREET/ADDRESS', 213800, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (638, 764, 'CLOSED', 'em-add 4100 Keele St, Fire Station 141; Jan 7, 2010', 'STREET/ADDRESS', 213807, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (669, 796, 'CLOSED', 'em-delete range 50-70 Cambridge Av; add 50  (prime), 70 (structure); Jan 19, 2010', 'STREET/ADDRESS', 213832, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (677, 803, 'CLOSED', 'ld/move to fix intersection of Ln W Yonge S St Mary and Cottage Lane-cadastral/imagery', 'STREET/ADDRESS', 213837, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (691, 820, 'CLOSED', 'dm - moving 2781 Markham Rd to correct parcel - ltr Jun 03/08', 'STREET/ADDRESS', 213849, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (703, 829, 'IN PROGRESS', 'ld- amalgamate 5 Lower Sherbourne St, 190 Queens Quay E & 12 Bonnycastle St; retain 26 & 190 for numbering later -torlet 6Apr2009. ', 'STREET/ADDRESS', 206828, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (704, 830, 'CLOSED', 'dm - add 473 ENT to 477 Brimley Rd - torlet Jun 02/09', 'STREET/ADDRESS', 213855, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (709, 835, 'HOLD', 'em-cofa add 117, 119 Haslam St; Feb 10, 2010', 'STREET/ADDRESS', 206865, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (710, 839, 'HOLD', 'em-cofa add 77, 79 Lake Cres; Feb 11, 2010', 'STREET/ADDRESS', 206871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (711, 840, 'IN PROGRESS', 'em-rev lett (Aug 7, 2008); add 38 Grand Magazine St (tower B), 35 Bastion St (tower A), 80-88 Sloping Sky Mews - towns, 32-42 Grand Magazine St live-work; 183-195 Fort York Blvd - live-work; 96 Sloping Sky Mews - live work; 23-39 Bastion St live-work', 'STREET/ADDRESS', 206871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (712, 838, 'HOLD', 'em-cofa add 32, 34, 36 Boulton Av; Feb 11, 2010', 'STREET/ADDRESS', 206871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (713, 836, 'CLOSED', 'em-add 16 Bloorview Pl, entr for 10 Bloorview Pl, pt of 25 Buchan Crt; amenity bldg; Feb 11, 2010', 'STREET/ADDRESS', 213859, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (714, 837, 'CLOSED', 'em-add 1-11 Wingreen Crt; Feb 10, 2010', 'STREET/ADDRESS', 213860, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (719, 845, 'CLOSED', null, 'STREET/ADDRESS', 213864, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (740, 867, 'CLOSED', 'Modify PRMs to ENTs at Peach Tree Path and Maplebranch Path/MPAC', 'STREET/ADDRESS', 213882, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (751, 878, 'CLOSED', 'ld/add Ln N Mortimer E Glebemount & Ln N Mortimer W Woodbine-Apset', 'STREET/ADDRESS', 213887, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (755, 882, 'IN PROGRESS', 'Recapturing oneway street segments that are lost when the segment is deleted and a new segment is created in its place.', 'STREET/ADDRESS', 207244, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1548, 1697, 'IN PROGRESS', null, 'STREET/ADDRESS', 214520, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1550, 1699, 'IN PROGRESS', 'CEdit internal testing. January 2013', 'REFERENCE PLAN', 214550, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (687, 813, 'CLOSED', 'mm-add laneways names at Weston/Sheppard new subdiv/Plan 66M-2747', 'STREET/ADDRESS', 213846, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (707, 833, 'HOLD', 'ld/50H12-sever into 252 & 240 Mc Caul St; expire 65 Henry St; fix laneway segments-Torlet 8Apr2009 for JF, cadastral', 'STREET/ADDRESS', 206860, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (727, 853, 'CLOSED', 'ld/add name- Tor Police 23 Division  to 5230 Finch Ave W(formerly addr 2126 Kipling Ave)-Tor Pol Web/Sandy Briell of Tor Pol emailed 19Feb2010', 'STREET/ADDRESS', 213870, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (728, 854, 'CLOSED', 'ld/45F-add Name Tor Police 22 Division Sub-Station to 60 Birmingham St-TorPol Web/SBriell emailed 19Feb2010', 'STREET/ADDRESS', 213871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (732, 859, 'CLOSED', 'ld/46N-add common name St Basil the Great to 20 Starview Lane-TCDSB', 'STREET/ADDRESS', 213875, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (736, 863, 'HOLD', 'JF-DM-758 Midland Av, August 10, 2009', 'STREET/ADDRESS', 207106, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (737, 864, 'CLOSED', 'JF-DM 126 Ashridge Drive, August 6, 2009', 'STREET/ADDRESS', 213879, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (738, 865, 'CLOSED', 'JF-LD 7 Hart House Circle, August 13, 2009', 'STREET/ADDRESS', 213880, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (768, 896, 'CLOSED', 'mm-Add 578,580 Doris Ave(temp stub)/NYLet-9Sep2008', 'STREET/ADDRESS', 213898, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (769, 897, 'CLOSED', 'ld/to move256D & C Augusta Ave-mpac/LIM', 'STREET/ADDRESS', 213899, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (779, 907, 'CLOSED', 'mm-del non-exis segment Maidenhair Lane at Red Hawk Rd/PropDataMap/FldChkd 11Mar2010', 'STREET/ADDRESS', 213911, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (790, 918, 'CLOSED', 'em-split 260 Geary Av into 260 and 274 Geary Av; March 12,2010', 'STREET/ADDRESS', 213920, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (791, 919, 'CLOSED', 'em-renum 99, 101, 103, 105 Walmer Rd to A, B and 111 Berrnard Av renum to 111A, 111B; March 11, 2010', 'STREET/ADDRESS', 213921, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (795, 923, 'CLOSED', 'ld/edit 80 Queensdale Ave - fcode toPRV school-Ecole elementaire La Mosaique -Tor Elections Coor/csdsco.on.ca', 'STREET/ADDRESS', 213925, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (796, 924, 'HOLD', 'em-cofa for 3, 7 Summerland Terr, March 17, 2010', 'STREET/ADDRESS', 207611, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (806, 934, 'CLOSED', 'ld/47j11-edit to move 756 to 770 Annette St into correct parcels as per Mpac/ cadstral/em', 'STREET/ADDRESS', 213931, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (822, 952, 'CLOSED', 'ld/52H11- delete addr pts on the Don Mount Crt (1-414) land north of Thompson St & east of Carroll St-FC 29Mar2010/ Torlets 28Jun2006/01Aug2008.', 'STREET/ADDRESS', 213946, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (837, 965, 'CLOSED', 'ld/45H-edit fcode fr Public School Primary to Other office bldg for 70 Chartwell Rd-GCC-km/google streetview', 'STREET/ADDRESS', 213957, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (841, 966, 'HOLD', 'ld/46G22-revise to LSSE- 66 & 888; SE-68 to 84, 92 to 96 Park Lawn Rd-Torlet 17June2009 for JF', 'STREET/ADDRESS', 207918, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (852, 983, 'HOLD', 'JF-DM-43 Devonridge Cr, January 12, 2010', 'STREET/ADDRESS', 207990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (853, 981, 'IN PROGRESS', 'JF-155 St Clair Av W, April 12, 2010', 'STREET/ADDRESS', 207990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (854, 980, 'HOLD', 'JF-MM 85 Lake Cr, April 12, 2010', 'STREET/ADDRESS', 207990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (855, 982, 'HOLD', '225-239Finch AveE-HayesLa-StrawflowerMews.pdf', 'STREET/ADDRESS', 207990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (856, 984, 'CLOSED', 'mm-Rock Fernway private road - fix loc/PhotoMap2009', 'STREET/ADDRESS', 213966, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (871, 999, 'IN PROGRESS', 'Changing Jamestown Cres to one-way', 'STREET/ADDRESS', 208098, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (881, 1011, 'CLOSED', 'mm-Ln S Bloor W Perth - close/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213981, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (888, 1018, 'IN PROGRESS', 'Adding trails found in 2010 Toronto Cycling Map', 'STREET/ADDRESS', 208181, -1);
--commit;
--PROMPT 500 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (902, 1032, 'CLOSED', 'JF-1152 Glengrove Av, April 29, 2010', 'STREET/ADDRESS', 208283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (917, 1047, 'CLOSED', 'ld/ to add 885, 885A & 887 O''Connor Dr-Mun. ltr to follow/Mpac/EYref map5/FCmay42010', 'STREET/ADDRESS', 214001, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (936, 1068, 'CLOSED', 'mm-modified 106 Winnett Ave - STR to PRM/Cadastral', 'STREET/ADDRESS', 214010, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (937, 1069, 'CLOSED', 'ld/to move 338, 392 Queen St E & 1, 3 Trefann St-imagery/inq fr SWM', 'STREET/ADDRESS', 214011, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (950, 1082, 'CLOSED', 'mm-add 179-189 Barrington Av, entr for 195; May 19, 2010', 'STREET/ADDRESS', 214021, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (960, 1092, 'CLOSED', 'JF-44 Sesame St, May 10, 2010', 'STREET/ADDRESS', 214026, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (961, 1093, 'CLOSED', 'JF-493 Parliament St, May 6, 2010', 'STREET/ADDRESS', 214027, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (962, 1094, 'HOLD', 'JF-174 Old Yonge St, May 26, 2010', 'STREET/ADDRESS', 208740, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (971, 1103, 'CLOSED', 'em-amal 3 and 5 Walker Rd into 5; May 19, 2010', 'STREET/ADDRESS', 214035, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (983, 1115, 'CLOSED', 'em-amal 2464 Bloor St West and 12 Riverview Gdns, into 2464; June 3, 2010', 'STREET/ADDRESS', 214042, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1025, 1157, 'IN PROGRESS', 'Changing one-way on Derby Street from Erin Street and a point 37.5 metres east of Parliament Street', 'STREET/ADDRESS', 209229, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1062, 1201, 'CLOSED', 'em-add 694 Scarlett Rd; June 29, 2010', 'STREET/ADDRESS', 214075, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1077, 1216, 'CLOSED', 'mm-18 Norton Ave fix loc/NYLet-25Jun2010; 25 McKee Ave fix loc/Cadastral', 'STREET/ADDRESS', 214081, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1087, 1227, 'IN PROGRESS', 'Changing one-way on Government Road from a point 19.0 metres east Royal York Road and Royal York Road', 'STREET/ADDRESS', 209553, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1091, 1231, 'HOLD', 'em-cofa of 44; add 46 Donald Av; July 12, 2010', 'STREET/ADDRESS', 209608, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1097, 1237, 'CLOSED', 'em-158 prime (from entr to 156), IGE memo, July 13, 2010', 'STREET/ADDRESS', 214092, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1104, 1244, 'CLOSED', '45F23-Modify to LSSE 8 Elsinore Path, move 50 Etta Wylie Rd to linked street-torlet 11Dec2006/Mpac/INQ amb&fire', 'STREET/ADDRESS', 214094, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1122, 1262, 'CLOSED', 'mm-add Ln W Lake Shore S Superior/By-Law 1990/115/Cadastral', 'STREET/ADDRESS', 213353, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1134, 1274, 'CLOSED', 'mm-modify Browns Lane (dupl) to Ln W Old Weston S St Clair/Cadastral', 'STREET/ADDRESS', 214101, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1137, 1277, 'CLOSED', 'Ld-50G-Move 222 Bremner Blvd, Metro Toronto Convention Ctr-South Bldg-Torlet 9Dec1994', 'STREET/ADDRESS', 214104, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1186, 1327, 'CLOSED', 'em-add 21 Church Av; McKee Parkette; Aug 27, 2010', 'STREET/ADDRESS', 214136, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1192, 1333, 'CLOSED', 'ld/edit linears at Jones Ave, Broadview Ave, Danforth Ave', 'STREET/ADDRESS', 214140, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1214, 1357, 'HOLD', 'em-omb for 24--248 Scarborough Rd; add 246A, 246B and 248; Aug 31, 2010; omb dated June 11, 2010; file: B0056/09TEY;', 'STREET/ADDRESS', 210577, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1228, 1373, 'CLOSED', 'JF-LD-1126 Gerrard St E, August 18, 2010', 'STREET/ADDRESS', 214162, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1229, 1372, 'HOLD', 'JF-LD-52 Ava Rd, August 17, 2010', 'STREET/ADDRESS', 210658, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1230, 1374, 'CLOSED', 'mm-add Heatherside Rd/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214163, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1235, 1379, 'CLOSED', 'em-add 210 Laird Dr, entr for 206; Sept 22, 2010', 'STREET/ADDRESS', 214166, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1237, 1381, 'CLOSED', 'em-IGE , 805 Jane St; Sept 21, 2010', 'STREET/ADDRESS', 214167, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1248, 1392, 'CLOSED', 'em-add 2965-3094 Kingston Rd, individual addresses for Cliffcrest Plaza; Sept 23, 2010', 'STREET/ADDRESS', 214177, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1264, 1409, 'CLOSED', 'em-add 185 Carrier Dr; Oct 12, 2010', 'STREET/ADDRESS', 214190, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1265, 1408, 'CLOSED', 'em-add 101 Westmore Dr, Oct 14, 2010', 'STREET/ADDRESS', 214189, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1274, 1418, 'CLOSED', 'ld/delete 510 Sherbourne St & fix laneways -not in Mpac/LIM/FC 25Oct10', 'STREET/ADDRESS', 214199, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1275, 1419, 'CLOSED', 'em-add 1156 Warden Av; to assmt 2032-2040 Lawrence Av E; Oct 19, 2010', 'STREET/ADDRESS', 214200, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1286, 1432, 'CLOSED', 'mm-Green Bush Dr, Fontainbleau Dr area -fix addrs loc/Cadastral', 'STREET/ADDRESS', 214210, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1287, 1434, 'HOLD', 'em-add 630 Avenue Rd (rental), 201 Lonsdale Rd (res condo), Nov 1, 2010', 'STREET/ADDRESS', 211118, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1288, 1435, 'HOLD', 'em-amal 745 and 749 Ossington Av; carpark 104; 745 Ossington Av; Nov 1, 2010', 'STREET/ADDRESS', 211118, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1289, 1436, 'CLOSED', 'em-renumber 538R Yonge St to 145 St Luke La, used 10 Breadalbane St; Nov 1, 2010', 'STREET/ADDRESS', 214211, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1290, 1433, 'HOLD', 'em-cofa for 255 Christie St; add 42A, 42B, 42C Yarmouth Rd; Nov 1, 2010', 'STREET/ADDRESS', 211118, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (21, 112, 'CLOSED', null, 'STREET/ADDRESS', 200056, 200074);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (23, 115, 'CLOSED', 'Add extension - Jeannette St in the National St/Olga St area -dm', 'STREET/ADDRESS', 201385, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (29, 122, 'CLOSED', 'em-renumber 724 Brimley Rd to 722; Dec 8, 2008', 'STREET/ADDRESS', 200122, 200246);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (49, 144, 'CLOSED', 'mm 54M Modify 145 Brookbank Dr, 2A Wallingford Rd(addr class)', 'STREET/ADDRESS', 213370, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (52, 146, 'CLOSED', '56Q-Modify 69 to 89 Silver Springs Blvd/SW Bin/Mpac/yelw/SC bk', 'STREET/ADDRESS', 213372, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (53, 147, 'CLOSED', 'mm 49K Modify 18 Jesmond Ave,Str to Prm/Mpac', 'STREET/ADDRESS', 213373, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (56, 150, 'CLOSED', 'ld/44P-Mod 1130 Albion Rd to S SE of 1104(mpac has ranged addr as PRM)- imagery/planning-', 'STREET/ADDRESS', 213376, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (60, 154, 'HOLD', 'ld / 51H22-Merge 355 & 357 WellesleySt E to 357-Torlet 1Dec2008', 'STREET/ADDRESS', 200308, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (65, 159, 'CLOSED', 'mm 44P-Modify 1246 Albion Rd(fix loc)/MPAC/PhotoImagery 2005', 'STREET/ADDRESS', 213383, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (66, 160, 'CLOSED', '50J-add 15 Howland Ave as SSE to 318 Brunswick Ave/LIM/SWbin/FC15Jan09', 'STREET/ADDRESS', 213384, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (103, 203, 'CLOSED', 'em-add entr 26 Pine St; Feb 12, 2009; main: 1965 Lawrence Av W;', 'STREET/ADDRESS', 213413, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (109, 210, 'CLOSED', 'mm 53P Del 3080X Don Mills Rd W/Inhouse', 'STREET/ADDRESS', 213416, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (117, 218, 'CLOSED', 'mm 46H Unsplit Hazelridge Dr,Riverwood Pkwy, Glenaden Ave E(deleted laneway)/Inhouse', 'STREET/ADDRESS', 213424, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (123, 225, 'CLOSED', 'mm-modify 26,32,38 Carluke Cres/MPAC/NYRefMap', 'STREET/ADDRESS', 213428, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (124, 226, 'CLOSED', 'JF - Add 4 Carluke Cr and move 2 Carluke Cr ', 'STREET/ADDRESS', 213429, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (132, 234, 'CLOSED', 'ld/50H-Add 39 Ryerson Ave-FC10Mar09;Mod 39 & 21 Carr Street Crt to STR-LIM', 'STREET/ADDRESS', 213434, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (137, 240, 'CLOSED', 'em-add 395 Rhodes Av as entr for 393 Rhodes Av; Tor lett March 9, 2009;', 'STREET/ADDRESS', 213439, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (181, 294, 'IN PROGRESS', 'em-cofa-39 St Andrews Blvd, add 35 and 37 St Andrews Blvd;March 24, 2009', 'STREET/ADDRESS', 201773, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (183, 296, 'HOLD', 'em-5 Merrill Av; Merrill Park; March 24, 2009; amal ;', 'STREET/ADDRESS', 201818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (189, 302, 'HOLD', 'JF Add 121 Commander Blvd ', 'STREET/ADDRESS', 201870, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (200, 313, 'HOLD', 'em-cofa-196, 198, 200, 200A Clanton Park Rd add, April 2, 2009', 'STREET/ADDRESS', 202041, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (216, 329, 'CLOSED', 'ld/ add 1894 Lawrence Ave E as ENTR to 1892-Torlet 28May2009', 'STREET/ADDRESS', 213494, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (217, 330, 'CLOSED', 'ld/ add 274R Unwin Ave as per EM/Mpac/LIM', 'STREET/ADDRESS', 213495, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (235, 350, 'CLOSED', 'mm-add 2078 St Clair W/Cadastral/MPAC/PhotoImagery', 'STREET/ADDRESS', 213506, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (244, 359, 'CLOSED', 'dm - add ENTR 5504 Lawrence Ave E for 5500- MPAC Apr 27/09', 'STREET/ADDRESS', 213512, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (248, 357, 'INITIALIZED', null, 'STREET/ADDRESS', 202504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (259, 374, 'CLOSED', 'em-add 140, 150 Murison Blvd, assigned by Scarb in 1982; May 8, 2009', 'STREET/ADDRESS', 213523, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (274, 390, 'CLOSED', 'ld/edit 8 St Thomas St to S SE-21Dec2007', 'STREET/ADDRESS', 213534, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (279, 396, 'CLOSED', 'em-add 55 Station Rd; Stanley Av Park ; May 26, 2009', 'STREET/ADDRESS', 213539, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (280, 397, 'CLOSED', 'em-add 20 Ennerdale Rd; Marble Hill Parkette; May 26, 2009', 'STREET/ADDRESS', 213540, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (306, 425, 'CLOSED', 'Ld/del untravelled Ln E Leslie N Harriet-apset53H110105-0106-0107/Fc 8Jun2009', 'STREET/ADDRESS', 213559, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (315, 435, 'CLOSED', 'JF-MM-Add 596R Rushton Rd, March 3, 2009', 'STREET/ADDRESS', 213566, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (321, 441, 'CLOSED', 'JF-MM-2413R Lake Shore Blvd W, June 17, 2009', 'STREET/ADDRESS', 213570, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (333, 453, 'CLOSED', '51H Add 15 new names for public lanes in Cabbagetown Phase1/StNamigLet-17Jun2009, ByLaws2009', 'STREET/ADDRESS', 213580, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (335, 455, 'IN PROGRESS', 'em-amal 6440, 6444, 6448, 6452 Kingston Rd, sever into 1-15 Smithy Crt and 1-33 and 4-20 Hearth Pl; Aug 12, 2009', 'STREET/ADDRESS', 203677, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (353, 474, 'CLOSED', 'dm - moving 34 to 102  Trailridge Cres - field check / BINS solid waste Aug 12/09', 'STREET/ADDRESS', 213590, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (361, 482, 'HOLD', 'JF-LD-Add 138, 146 Princess St and 277, 279 King St W, April 28, 2009', 'STREET/ADDRESS', 203939, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (382, 504, 'HOLD', 'em-add 10 Viking La, prop park; Aug 31, 2009', 'STREET/ADDRESS', 204165, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (398, 520, 'CLOSED', 'mm-Add Toronto-Centre Island Ferry Route', 'STREET/ADDRESS', 213625, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (399, 522, 'CLOSED', 'JF-MM-Add 361 Kane Av, August 28, 2009', 'STREET/ADDRESS', 213626, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (403, 526, 'HOLD', 'JF-DM Add 2787AB Victoria Park Av, Sept 4, 2009', 'STREET/ADDRESS', 204326, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (404, 528, 'CLOSED', 'em-add 364 The West Mall , West Mall park; Sept 2, 2009', 'STREET/ADDRESS', 213630, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (405, 527, 'CLOSED', 'em-150, 160 Carsbrooke Rd; renumber from 570, 572 The West Mall, Letter Feb 15, 1999;', 'STREET/ADDRESS', 213629, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (408, 531, 'CLOSED', 'ld/ del 401 CE Avenue Rd N Ramp', 'STREET/ADDRESS', 213633, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (437, 560, 'CLOSED', 'Marilyn Bell Park Bicycle Paths', 'STREET/ADDRESS', 213657, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (440, 563, 'CLOSED', 'em-add 448 Westomount Av; letter JF; Sept 11, 2009', 'STREET/ADDRESS', 213660, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (446, 569, 'CLOSED', 'Paul Markway,Rock Mossway,Aspenwood Dr,Purple Sageway, Jenny Wrenway, Thimble Berryway-fix addr loc', 'STREET/ADDRESS', 213666, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (450, 573, 'CLOSED', 'mm-modify f.code to walkway/Fld chkd -20 Oct2006', 'STREET/ADDRESS', 213668, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (462, 585, 'CLOSED', 'em-add 1513-1535 Davenport Rd, entr for 1541; Sept 24, 09', 'STREET/ADDRESS', 213680, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (478, 601, 'IN PROGRESS', 'West Toronto Rail Path', 'STREET/ADDRESS', 204840, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (484, 607, 'CLOSED', 'Add node to connect Explorer Dr to Eglinton Ave W', 'STREET/ADDRESS', 213694, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (487, 610, 'CLOSED', null, 'STREET/ADDRESS', 213697, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (492, 616, 'IN PROGRESS', 'JF-MM-Add 351A and 351B Greenfield Av, March 19, 2009', 'STREET/ADDRESS', 205010, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (493, 615, 'HOLD', 'JF-MM-Add 74A-74B Gwendolen Cr, September 29, 2009', 'STREET/ADDRESS', 205010, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (509, 632, 'CLOSED', 'Removing one-way segment on Maitland Place', 'STREET/ADDRESS', 213714, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (516, 639, 'CLOSED', null, 'STREET/ADDRESS', 213720, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (519, 644, 'CLOSED', 'mm-Add Pherrill Mews/StNamingLet-25May2008', 'STREET/ADDRESS', 206521, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (545, 669, 'CLOSED', 'mm-del part StanleyTer at Wellington St W(road closed)FireDeptLet-21Oct2009/PhotoMap2009', 'STREET/ADDRESS', 213748, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (551, 675, 'CLOSED', 'mm-add 30,32,34 St Dennis Dr (STR to 30-34)/MPAC/FldChkd-2Nov2009', 'STREET/ADDRESS', 213753, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (554, 678, 'CLOSED', 'mm-add 134,136,138 Berry Rd(STR to 134-138)/MPAC/FldChkd-3Nov2009', 'STREET/ADDRESS', 213755, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (565, 692, 'CLOSED', 'mm-add 31,33,35 King St (Ent to 31-35)/MPAC/FldChkd-9-Nov2009', 'STREET/ADDRESS', 213765, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (566, 696, 'HOLD', 'JF-LD-Add 73 Soudan Av, September 30, 2009', 'STREET/ADDRESS', 205514, -1);
--commit;
--PROMPT 600 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (567, 697, 'HOLD', 'JF-LD-Add 140 Morse St, September 24, 2009', 'STREET/ADDRESS', 205514, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (568, 698, 'CLOSED', 'mm-Add 134 Ian MacDonald Blvd (Ent to 130)/FireDept-KO-Oct2009/FldChkd-9Nov2009', 'STREET/ADDRESS', 213767, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (584, 709, 'CLOSED', 'em-sever 1400 Eglinton Av W; letter Jan 22, 08; add Nov 23, 09', 'STREET/ADDRESS', 213773, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (602, 727, 'CLOSED', 'Adding Christie Pits Trail at MONTROSE AVE to CRAWFORD ST for Cycling Project.', 'STREET/ADDRESS', 213786, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (655, 781, 'CLOSED', 'ld/move 233 & 233V McIntosh St -Mpac/FC 19Feb08', 'STREET/ADDRESS', 213820, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (657, 783, 'HOLD', 'em-add 4 Graydon Hall Dr; res condo, add 2A, 2B, 2C, 2D, 2E-townhomes; Jan 20, 2010', 'STREET/ADDRESS', 206312, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (658, 784, 'CLOSED', 'em-add 2 Graydon Hall Dr; IGE address; Jan 20, 2010', 'STREET/ADDRESS', 213822, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (667, 793, 'HOLD', 'em-cofa 556, 558 Scarlett Rd, 13 Chapman Rd, B28/09EYK, Jan 22, 2010', 'STREET/ADDRESS', 206372, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (671, 797, 'CLOSED', 'em-renumb 1469 Dundas St E to 114 Curzon St; Jan 7, 2010', 'STREET/ADDRESS', 213833, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1547, 1696, 'IN PROGRESS', null, 'STREET/ADDRESS', 214513, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (688, 814, 'CLOSED', 'ld/47H22-renumber 172 Ellis Park Rd to 3 Hush Lane & redigitize Hush Lane-Torlet 5Feb2010/Pol Inq./cadastral', 'STREET/ADDRESS', 213847, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (700, 826, 'CLOSED', 'dm - move 200 Town Centre  Crt to correct parcel - e-mail ltr Feb 09/10', 'STREET/ADDRESS', 213853, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (701, 827, 'CLOSED', 'mm-modify  Ln E Yonge N Carlton to Reverend Porter Lane/By-Law 1070-2009, add arc Dan Leckie Way/Photo-Imagery 2009 ', 'STREET/ADDRESS', 213854, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (718, 843, 'CLOSED', 'ld/47J21-add (SSE)2561 &  2565; (SE)2567 & 2569 for 2555 St Cliar Ave W-Torlet 21May2009 for JF', 'STREET/ADDRESS', 213862, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (752, 879, 'CLOSED', 'mm-Modify laneway to Clovis John Brooks Lane(3 arcs)/By-Law 1192-2009', 'STREET/ADDRESS', 213888, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (773, 901, 'CLOSED', 'ld/ 48J11-add 16 Alpine Ave as ENTR to 1655 Dupont St-Torlet 3Jun2009 for JF', 'STREET/ADDRESS', 213903, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (780, 908, 'CLOSED', 'mm-fix loc 3025 to 3061 Finch Ave W/NYLet-8Mar2006/PhotoMap2009', 'STREET/ADDRESS', 213912, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (807, 935, 'CLOSED', 'mm-Extend private Sherway Gardens Rd, west of Sherway Gate/By-Law 142-2010', 'STREET/ADDRESS', 213932, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (814, 942, 'CLOSED', 'mm-add temp stub dockside Dr and Knapp Lane/Plan 66M-2476', 'STREET/ADDRESS', 213938, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (823, 955, 'CLOSED', 'em-change 1541-1543 Bayview Av to 1541; add 1541A, 1541B, 1543 as entr addr; March 23, 2010', 'STREET/ADDRESS', 213948, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (824, 953, 'HOLD', 'em-cofa of 1, 3 Dresden Rd, add 112, 114, 116, 118 Faywood Blvd, March 24, 2010', 'STREET/ADDRESS', 207803, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (825, 957, 'CLOSED', 'em-add 776A, 778 Annette St, entr for 778 Annette St; March 30, 2010', 'STREET/ADDRESS', 213950, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (826, 949, 'CLOSED', 'em-add 185 Mount Pleasant Rd, trail sign for Belt Line Trail; March 22, 10', 'STREET/ADDRESS', 213943, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (827, 956, 'CLOSED', 'em-add 92, 94, 98, 100, 104 Eastdale Av; entr for 90 Eastdale Av; March 23, 2010', 'STREET/ADDRESS', 213949, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (828, 950, 'CLOSED', 'em-add 156 South Dr, trail sign for Belt Line Trail; March 22, 2010', 'STREET/ADDRESS', 213944, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (829, 954, 'CLOSED', 'em-change 1535-1539A Bayview Av to 1535; March 23, 2010', 'STREET/ADDRESS', 213947, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (830, 958, 'CLOSED', 'em-add 780A Annette St, entr for 780 Annette St; March 30, 2010', 'STREET/ADDRESS', 213951, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (834, 962, 'HOLD', 'JF-MM-1100 Sheppard Av W, November 20, 2009', 'STREET/ADDRESS', 207878, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (869, 997, 'CLOSED', 'mm-modify Oscar Romero Pl to private/Cadastral', 'STREET/ADDRESS', 213974, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (882, 1012, 'CLOSED', 'ld/edit 181 Cedric Ave to LSSE-Mpac/anu', 'STREET/ADDRESS', 213982, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (895, 1027, 'HOLD', 'JF-21 Damask Av, April 22, 2010', 'STREET/ADDRESS', 208255, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (896, 1026, 'COMPLETED', 'JF-452 Rimilton Av, April 23, 2010', 'STREET/ADDRESS', 208255, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (897, 1025, 'HOLD', 'JF-640 Durie Street, April 6, 2010', 'STREET/ADDRESS', 208255, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (898, 1028, 'CLOSED', 'mm-Del part Bridgend St-untravelled/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 213990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (907, 1039, 'HOLD', 'JF-197 Valley Rd, March 26, 2010 ', 'STREET/ADDRESS', 208331, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (908, 1037, 'CLOSED', 'JF-17 MontgomeryRd, March 25, 2010', 'STREET/ADDRESS', 213995, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (909, 1040, 'CLOSED', 'JF-160 Nashdene Rd, March 26, 2010', 'STREET/ADDRESS', 213997, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (910, 1038, 'CLOSED', 'JF-164HounslowAv, March 26, 2010 ', 'STREET/ADDRESS', 213996, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (923, 1054, 'HOLD', 'JF-106-108 Holland Park Av, January 29, 2010 ', 'STREET/ADDRESS', 208421, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (924, 1053, 'HOLD', 'JF-438-440 Woburn Av, January 18, 2010  ', 'STREET/ADDRESS', 208421, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (925, 1056, 'HOLD', 'JF-89 Chiltern Hill Rd, May 4, 2010  ', 'STREET/ADDRESS', 208421, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (926, 1055, 'HOLD', 'JF-236 Manor Rd E, December 18, 2009 ', 'STREET/ADDRESS', 208421, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (948, 1080, 'CLOSED', 'mm-del part Ln S Scarlett S Hill Garden - untravelled (46L220401)/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214019, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (954, 1086, 'CLOSED', 'mm-del 50-60 Charles St E/LIM/MPAC', 'STREET/ADDRESS', 214023, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (965, 1102, 'CLOSED', 'em-assmt, range 724-726 The Queensway; May 20, 2010', 'STREET/ADDRESS', 214034, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (966, 1100, 'CLOSED', 'em-assign 732 The Queensway; May 20, 2010', 'STREET/ADDRESS', 214032, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (967, 1098, 'CLOSED', 'em-amal for 742, new roll; May 20, 2010', 'STREET/ADDRESS', 214030, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (968, 1097, 'HOLD', 'em-cofa of 222 Park Lawn Rd, add 220; May 27, 2010', 'STREET/ADDRESS', 208769, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (969, 1101, 'CLOSED', 'em-add 734A, 734 1/2 ; entr for 734', 'STREET/ADDRESS', 214033, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (970, 1099, 'CLOSED', 'em-assmt-range 728-730 The Queensway; May 20, 2010', 'STREET/ADDRESS', 214031, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (984, 1117, 'HOLD', 'em-cofa , add 80, 82 Laurel Av; June 3, 2010', 'STREET/ADDRESS', 208896, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (985, 1116, 'HOLD', 'em- cofa, add 599A, 599B Oxford St, June 3, 2010', 'STREET/ADDRESS', 208896, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (987, 1119, 'CLOSED', 'dm - changing 177 Caledonia Rd place name '' Hughes Junior Public School '' to '' Beatrice House '' - e-mail ltr 6/4/2010', 'STREET/ADDRESS', 214044, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1001, 1133, 'IN PROGRESS', null, 'STREET/ADDRESS', 209068, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1013, 1145, 'CLOSED', 'em-add 74A Gledhill Av; June 14, 2010', 'STREET/ADDRESS', 214057, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1033, 1166, 'CLOSED', 'mm-Grange Ave,Ryerson Ave-fix loc/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214063, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1068, 1207, 'CLOSED', 'dm - re-naming Leafield Dr S section to Leafield Dr - SC ltr Jul 02/2010 - By-law 711-2010', 'STREET/ADDRESS', 214078, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1083, 1223, 'CLOSED', '53H-Move 122 & 124 Kingston Rd fr corr into parcels', 'STREET/ADDRESS', 214083, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1092, 1232, 'CLOSED', 'em-add 55 Antibes Dr; July 9, 2010', 'STREET/ADDRESS', 214088, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1096, 1236, 'HOLD', 'em-cofa for 311 Pacific Av; add 58 Aziel St; July 8, 2010', 'STREET/ADDRESS', 209623, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1172, 1313, 'CLOSED', 'mm-del Roys Sq centreline and addresses/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214131, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1174, 1315, 'CLOSED', 'em-assign 398E Danforth Rd, city-owned, Aug 13, 2010', 'STREET/ADDRESS', 214237, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1175, 1316, 'CLOSED', 'ld-editing laneways at Howland/ Gerrard/ Logan', 'STREET/ADDRESS', 214238, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1179, 1320, 'COMPLETED', 'ld-sever 226 to 224& 226 Aldercrest Rd-ETlet9-9-2009.', 'STREET/ADDRESS', 210341, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1180, 1323, 'HOLD', 'em-cofa for 1286, 1294 Islington Av; add 15 Cordova Av; Aug 25, 2010', 'STREET/ADDRESS', 210345, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1181, 1321, 'CLOSED', 'em-add 502 Sammon Av; Century Schoolhouse; Aug 25, 2010', 'STREET/ADDRESS', 214134, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1182, 1322, 'HOLD', 'em-cofa for 13 Lapp St, add 15; Aug 25, 2010', 'STREET/ADDRESS', 210345, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1200, 1342, 'CLOSED', 'dm - BY-LAW -designate properties as '' cultural heritage'' ', 'STREET/ADDRESS', 214144, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1219, 1364, 'CLOSED', 'JF-LD-152 Dundas St E, September 3, 2010', 'STREET/ADDRESS', 214156, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1220, 1362, 'HOLD', 'JF-LD-89-91 Bogert Av, August 26, 2010', 'STREET/ADDRESS', 210614, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1221, 1363, 'HOLD', 'JF-DM-46 Forty First Av, August 27, 2010', 'STREET/ADDRESS', 210614, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1244, 1388, 'CLOSED', 'ld/edit Principal Name fr CTR to CENTER', 'STREET/ADDRESS', 214173, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1247, 1391, 'CLOSED', 'em-add 1245 Sheppard Av W, 80 Carl Hall Rd - prop subway station, entr for 1377 Sheppard Av West, Downsview Park; May 238, 2010, Sept 21, 2010 - done Oct 1, 2010', 'STREET/ADDRESS', 214176, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1253, 1400, 'HOLD', 'em-reassigned 569 King St E, res condo; Sept 22, 2010', 'STREET/ADDRESS', 210861, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1254, 1399, 'HOLD', 'em-add 549 King St E, prop res condo, 2A, 2B, 2C, 2D Percy St towns, 33, 37 Sumach St retail; Sept 22, 2010', 'STREET/ADDRESS', 210861, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1255, 1397, 'CLOSED', 'em-add 20 Prescott Av; carpark 133, entr 29 Blackthorn Av; Sept 27, 2010', 'STREET/ADDRESS', 214181, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1256, 1398, 'CLOSED', 'em-25 Wellesley Lane change to 25 Lourdes Lane; Sept 23, 2010', 'STREET/ADDRESS', 214182, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1257, 1401, 'CLOSED', 'mm-Fix loc and digitize Sargent Lane/Cadastral', 'STREET/ADDRESS', 214183, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1266, 1410, 'CLOSED', 'mm-266 to 398 Goldenwood Rd fix addr loc/Cadastral', 'STREET/ADDRESS', 214191, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1291, 1437, 'CLOSED', 'em-add 1967, 1969, 1971 Weston Rd; entr for 1965; Nov 2, 2010', 'STREET/ADDRESS', 214212, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1072, 1211, 'CLOSED', 'Fixing linear-Ed Evans Lane-cadastral', 'STREET/ADDRESS', 214079, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1074, 1213, 'IN PROGRESS', 'Changing one-way on Springhurst Avenue from Jameson Avenue and a point 85.3 metres south of King Street West', 'STREET/ADDRESS', 209478, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1088, 1228, 'IN PROGRESS', 'Changing one-way on Beograd Gardens from a point 39 metres south of Roselawn Ave (west leg)  and Roselawn Ave (east leg); Changing one-way on  Tommy Douglas Gardens from a point 155 metres south/east of Roselawn Ave (west leg) and Roselawn Ave (west leg)', 'STREET/ADDRESS', 209567, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1102, 1242, 'HOLD', 'JF-221-225 Glen Park Av, July 8, 2010', 'STREET/ADDRESS', 209682, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1103, 1243, 'HOLD', 'JF-2-6 Basswood Rd, 61-71 Churchill Av, July 13, 2010', 'STREET/ADDRESS', 209682, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1184, 1325, 'IN PROGRESS', 'Changing one-way on Holland Park Ave to Glenholme Avenue and a point 40 metres west of Oakwood Avenue', 'STREET/ADDRESS', 210394, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1202, 1344, 'CLOSED', 'ld/53N-Edit fr STR to LSSE- 50 Graydon Hall Dr-Mpac/parcel/meenaS', 'STREET/ADDRESS', 214146, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1298, 1445, 'CLOSED', 'em-add 33A, 33B, 35A, B, C Bathurst St, entr for 38 Niagara St, retail; Nov 8, 2010', 'STREET/ADDRESS', 214218, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1321, 1469, 'CLOSED', 'mm-add 26,28,30,32,34,36,38 Summerhill Rd/Solid Waste/MPAC/FldChkd-29Nov2010', 'STREET/ADDRESS', 214242, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1330, 1477, 'IN PROGRESS', 'dm  - modify PRIME addrs - 5979 to 6025 Steeles Ave E becoming ENTR - MPAC ltr 12/02/2010', 'STREET/ADDRESS', 211448, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1333, 1480, 'CLOSED', 'dm - edit ENTR 5979 to 6025 Steeles Ave E - SC ltr Nov 19/2008', 'STREET/ADDRESS', 214250, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1336, 1483, 'CLOSED', 'ld/54H11-add missing addrs on 571 Dundas St W, Willison, White Court-Mpac/cadastral', 'STREET/ADDRESS', 214253, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1355, 1502, 'CLOSED', 'em-add 38 Pullman Crt; Jan 5, 2011', 'STREET/ADDRESS', 214268, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1356, 1503, 'INITIALIZED', null, 'STREET/ADDRESS', 211726, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1365, 1512, 'HOLD', 'em-amal 17 Glebe Rd W, 1994, 2000, 2008 Yonge St , into 23 Glebe Rd W-res condo, 1996, 2000, 2008 Yonge St-commerc units; Jan 10, 2011', 'STREET/ADDRESS', 211772, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1381, 1528, 'CLOSED', 'JF-MM-425 Rimilton Av, November 17, 2009', 'STREET/ADDRESS', 214283, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1394, 1541, 'CLOSED', 'ld/52H-move 247 Langley Ave entr to 402 Pape Ave', 'STREET/ADDRESS', 214291, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1411, 1559, 'CLOSED', 'JD-MM-900 Don Mills Rd, January 25, 2011', 'STREET/ADDRESS', 214302, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1412, 1560, 'CLOSED', null, 'STREET/ADDRESS', 212368, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1413, 1558, 'CLOSED', 'JF-MM-190 Ellerslie Av, December 21, 2010', 'STREET/ADDRESS', 214301, -1);
--commit;
--PROMPT 700 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1429, 1576, 'CLOSED', '50H/ld-delete range 471-473 Bloor St W as per mpac/em', 'STREET/ADDRESS', 214314, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1437, 1584, 'CLOSED', 'em-add 10A Marbury Cr; entr for 10; Feb 15, 2011', 'STREET/ADDRESS', 214318, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1453, 1600, 'IN PROGRESS', 'ld/50G22-delete Ln E Widmer S Adelaide -BL785-2010', 'STREET/ADDRESS', 212590, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1454, 1601, 'CLOSED', 'ld/51K-delete ranged addrs:104-106 John St-mpac', 'STREET/ADDRESS', 214331, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1485, 1633, 'CLOSED', 'dm - moving addrs - 4-14 Etienne St- e-mail ltr Mar 14/011', 'STREET/ADDRESS', 214353, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1493, 1642, 'HOLD', 'ld/50F-edit feature code fr Shoreline to Trail -geo-id 1147674-Tor Prop Map/imagery', 'STREET/ADDRESS', 212964, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1519, 1668, 'HOLD', 'em-amal 20, 22, 24, 26 Churchill Av, 31, 33, 37, 41, 45 Horsham Av; new res condo: 68 Canterbury Pl and 20 towns: 76, 78 Canterbury Pl, 26 Churchill Av, 351-369 Beecroft Rd, 27-39 Horsham Av; March 22, 2011', 'STREET/ADDRESS', 213105, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1534, 1683, 'CLOSED', null, 'STREET/ADDRESS', 213342, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (15, 106, 'HOLD', 'em-cofa-2513 Keele St; Dec 22, 2008;', 'STREET/ADDRESS', 200029, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (19, 110, 'CLOSED', null, 'STREET/ADDRESS', 200051, 200245);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (20, 111, 'CLOSED', null, 'STREET/ADDRESS', 200052, 200053);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (76, 171, 'CLOSED', 'ld/ 50J- add 60 Howland ave as LSSE & mod addr 62 to SE', 'STREET/ADDRESS', 213393, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (77, 172, 'CLOSED', 'em-14 Byng Av, assign, city-owned; Jan 27, 2009;', 'STREET/ADDRESS', 213394, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (89, 187, 'CLOSED', 'mm 42F Add Ln W Browns N Burlingame/EB129443', 'STREET/ADDRESS', 213402, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (90, 188, 'CLOSED', 'mm Add Ln W Browns S Roseland/ByLaw-10273', 'STREET/ADDRESS', 213403, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (112, 213, 'CLOSED', 'mm 46H Del Ln N Sunnylea E Hazelridge/APSET 46H320401/FldChkd-14Aug2008', 'STREET/ADDRESS', 213419, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (169, 282, 'CLOSED', 'mm Modify 14 addrs Prm to Ent  to 291 York Mills Rd/Bayview Ave/MPAC/Fld Chkd26 Mar2009', 'STREET/ADDRESS', 213463, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (170, 283, 'CLOSED', null, 'STREET/ADDRESS', 213464, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (192, 305, 'HOLD', 'JF - Add 149 Blantyre Av ', 'STREET/ADDRESS', 201941, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (223, 338, 'CLOSED', 'em-assign 740R Kennedy Rd, parland; April 16, 2009', 'STREET/ADDRESS', 213499, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (224, 337, 'HOLD', 'em-reserv 742A, B, C, D, E, F, G, H, J Kennedy Rd ; April 16, 2009', 'STREET/ADDRESS', 202386, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (225, 339, 'CLOSED', 'em-reserv 175 Dan Leckie Way , Northern Linear Park; April 16, 2009', 'STREET/ADDRESS', 213500, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (226, 336, 'CLOSED', 'em-assign 2 Katherine Rd; April 17, 2009', 'STREET/ADDRESS', 213498, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (228, 341, 'CLOSED', 'em-IGE memo, temp address 742 Kennedy Rd; April 22, 09', 'STREET/ADDRESS', 213502, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (232, 345, 'HOLD', 'JF-DM-BH-JF-442-456DawesRd 12ABGowerSt CaptainDemontLa', 'STREET/ADDRESS', 202447, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (234, 347, 'CLOSED', 'JF-LD-Add 18A Dacre ', 'STREET/ADDRESS', 213504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (269, 385, 'HOLD', 'em-add 1-33 Siger Crt, 51-67 Provost Dr; mix-use condo; May 11, 2009', 'STREET/ADDRESS', 202876, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (291, 410, 'HOLD', 'JF-LD-Split 112 Yorkville Av - May 27, 2009', 'STREET/ADDRESS', 203102, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (294, 413, 'CLOSED', 'em-add 200A Baldwin St, entr for 6 Littlehayes Lane; June 1, 2009', 'STREET/ADDRESS', 213550, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (298, 417, 'HOLD', 'JF-MM-Add 278 Searle Av, April 20, 2009', 'STREET/ADDRESS', 203152, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (299, 418, 'CLOSED', 'em-add 950-996 Albion Rd entr for 950-994 Albion Rd; June 4, 09', 'STREET/ADDRESS', 213552, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (312, 432, 'CLOSED', 'ld/50H23-Renaming to Terauley Lane-Apset 50H231201/BH', 'STREET/ADDRESS', 213564, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (322, 442, 'CLOSED', 'em-add 10 Gothic Av; park; June 17, 2009', 'STREET/ADDRESS', 213571, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (328, 448, 'CLOSED', 'em-renumber-13A to 13 and 13B to 15 Gilead Pl; Aug 4, 2009', 'STREET/ADDRESS', 213577, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (331, 451, 'COMPLETED', 'em-pt of 2230 Gerrard St East, 6 blocks of towns and 12 freeholds, Belleville St, Enroutes St, Brockville St; June 16, 2009, second letter to follow with new street names;', 'STREET/ADDRESS', 203566, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (338, 458, 'HOLD', 'em-cofa-176 Evelyn Av; Aug 14, 2009', 'STREET/ADDRESS', 203703, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (341, 461, 'CLOSED', 'Ld/Del 101 110 Shuter St & 224 George St(merged to 102)-LIM 97-04-21/TmmsDBurns', 'STREET/ADDRESS', 213584, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (370, 491, 'CLOSED', 'em-6-124 Cataraqui Cres, add entr for 2 Cataraqui Cres; Aug 27, 2009, assigned by former Scarborough;', 'STREET/ADDRESS', 213602, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (371, 492, 'CLOSED', 'em-34 Cedar Brae Blvd; entr for 32 Cedar Brae Blvd; in MPAC, assigned by former Scarborough; Aug 27, 2009', 'STREET/ADDRESS', 213603, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (379, 501, 'CLOSED', 'mm-Add Hanlan Point Ferry Route', 'STREET/ADDRESS', 213607, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (401, 524, 'CLOSED', 'em-add 434 Eglinton Av West; entr for 430 Eglinton Av W; Sept 4, 09', 'STREET/ADDRESS', 213628, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (434, 558, 'CLOSED', 'JF-DM - Add 14 Ashridge Dr, May 25, 2009', 'STREET/ADDRESS', 213655, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (435, 557, 'CLOSED', 'JF-LD-Add 287 Harbord St, May 21, 2009', 'STREET/ADDRESS', 213654, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (439, 562, 'CLOSED', 'mm-Add Ln S Eglinton E Northcliffe/By-Law 285-2002', 'STREET/ADDRESS', 213659, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (461, 584, 'CLOSED', null, 'STREET/ADDRESS', 213679, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (494, 617, 'CLOSED', 'mm-del Ln E Yonge N Hayden/By-Law 562-2009', 'STREET/ADDRESS', 213700, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (503, 626, 'CLOSED', null, 'STREET/ADDRESS', 213709, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (504, 628, 'CLOSED', 'em-add 7 Summerland Terr (former 7 Dunbloor Rd)letter Jan 22, 2008', 'STREET/ADDRESS', 213711, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (505, 627, 'CLOSED', 'em-add 5101, 5103 Dundas St W, entr for 50 Michael Power Pl, April 18, 2001', 'STREET/ADDRESS', 213710, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (506, 629, 'CLOSED', null, 'STREET/ADDRESS', 205146, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (507, 630, 'CLOSED', 'em-add 3710 Bloor St W, str for 3 Summerland Terr, block of towns, letter Nov 27, 2008', 'STREET/ADDRESS', 213712, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (564, 689, 'CLOSED', 'em-add 49, 77 Wynford Dr; former 59-75 Wynford Dr; Nov 9, 09;', 'STREET/ADDRESS', 213763, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (569, 699, 'CLOSED', 'mm-add 145 Arlington Ave/YRefMap/MPAC/FldChkd-12Nov2009', 'STREET/ADDRESS', 213768, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (611, 736, 'CLOSED', 'mm-add 521,523 Finch Ave W(Ent to 521-523)/NYRefMap/FldChkd-13Nov2009', 'STREET/ADDRESS', 213794, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (615, 740, 'COMPLETED', 'em-cofa 440 Valermo Dr, add 442; Dec 14, 09', 'STREET/ADDRESS', 206011, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (616, 742, 'HOLD', 'em-sever 700 Trethewey Dr; 8 freeholds, 2A,B, 4A, B, 6A, B, 8A, B Tedder St; Dec 15, 09', 'STREET/ADDRESS', 206011, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (617, 741, 'HOLD', 'em-reserv condo res/commer: 2 Anndale Dr, 5 Sheppard Av E, 4773, 4789 Yonge St; Dec 16, 09', 'STREET/ADDRESS', 206011, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (618, 743, 'CLOSED', 'em-add 721 Broadview Av, entr for 717; Dec 15, 09', 'STREET/ADDRESS', 213797, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (619, 744, 'HOLD', 'em-amal 65 St Nicholas St, 15 St Mary St and 692 Yonge St; add 75 St Nicholas St - res condo; 65, 67, 69, 71, 73 St Nicholas St - entr for 75 St Nicholas St; Dec 15, 2009', 'STREET/ADDRESS', 206011, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (640, 766, 'CLOSED', 'em-split 114, add 114 and 114A Farnham Av; Jan 5, 2010', 'STREET/ADDRESS', 213809, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (696, 824, 'CLOSED', 'JF-MM-18RangoonRd, January 22, 2010', 'STREET/ADDRESS', 213851, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (697, 822, 'HOLD', 'JF-LD-70 Edgewood Av, December 9, 2009', 'STREET/ADDRESS', 206782, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (698, 823, 'CLOSED', 'Task not used as work done previously.', 'STREET/ADDRESS', 213850, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (716, 842, 'IN PROGRESS', 'Renaming Portion of West Humber Trail to Humber River Trail to match bicycle signage in Toronto Parks. Renaming portion of West Humber Trail to Kipling Ave Recreational Trail that runs parallel to Kipling Ave.', 'STREET/ADDRESS', 206939, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (765, 893, 'CLOSED', null, 'STREET/ADDRESS', 213895, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (770, 898, 'CLOSED', 'mm-modify Jack Evelyn Wiggins Dr to Evelyn Wiggins Dr, Elia Dr to Jack Wiggins Lane, add public walkway Elia Lane/StNamingLet-23Feb2010', 'STREET/ADDRESS', 213900, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (771, 899, 'CLOSED', 'ld / Del range addr 15-25 Grange Rd; add name to 23 Grange Rd- FC 2Mar2010/mpac', 'STREET/ADDRESS', 213901, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (798, 926, 'HOLD', 'em-res condo 1888, 1900 Bayview Av; March 18, 2010', 'STREET/ADDRESS', 207619, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (802, 932, 'CLOSED', 'JF-MM-3597AEglintonAvW, March 16, 2010', 'STREET/ADDRESS', 213929, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (803, 930, 'CLOSED', 'JF-MM-2371 Weston Rd, March 16, 2010', 'STREET/ADDRESS', 213928, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (804, 931, 'HOLD', 'JF-LD-38ABBoswell Av, March 9, 2010', 'STREET/ADDRESS', 207642, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (811, 939, 'HOLD', 'em-cofa, add 68, 68A Oxford St, March 22, 2010', 'STREET/ADDRESS', 207734, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (812, 940, 'CLOSED', 'ld/60N- delete name-Tallpines CC & fcode-community/assembly hall to 65 Rylander Blvd & add comm.centr to 64 Rylander Blvd-Mpac/google maps/gcc-km', 'STREET/ADDRESS', 213936, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (862, 990, 'IN PROGRESS', 'Removing one-way street from Renfrew Place between John Street and St. Patricks Market ', 'STREET/ADDRESS', 208052, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (903, 1033, 'HOLD', 'JF-1152 Glengrove Av, April 29, 2010', 'STREET/ADDRESS', 208284, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (989, 1121, 'CLOSED', 'mm-add parks name-Randy Padmore Park, 47 Denison Ave/Parks,Forestry Let-09Jun2010', 'STREET/ADDRESS', 214045, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1017, 1149, 'IN PROGRESS', 'Changing one-way on Bristol Avenue from a point 39 metres north of Geary Avenue and Davenport Road', 'STREET/ADDRESS', 209177, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1043, 1178, 'IN PROGRESS', 'Changing one-way from Jenoves Place from a point 25.9 metres east of George Street South and the lane first south of Front Street East', 'STREET/ADDRESS', 209306, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1154, 1295, 'CLOSED', 'em-move 418-430 to correct parcel; Aug 12, 2010', 'STREET/ADDRESS', 214116, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1161, 1302, 'CLOSED', 'em-assign 208 Clonmore Dr; Aug 16, 2010', 'STREET/ADDRESS', 214122, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1162, 1303, 'CLOSED', 'em-assign 530 Bedford Park Av; Aug 16, 2010', 'STREET/ADDRESS', 214123, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1337, 1484, 'HOLD', 'em-add 1020 Bay St, prop park, Dec 6, 2010', 'STREET/ADDRESS', 211486, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1347, 1494, 'HOLD', 'em-cofa for 175 Churchill Av; add 175A, 175B; Dec 20, 2010', 'STREET/ADDRESS', 211665, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1348, 1495, 'CLOSED', 'em-renumber 547 to 549 Rouge Hills Dr; Dec 20, 2010', 'STREET/ADDRESS', 214262, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1357, 1504, 'CLOSED', 'dm - change internal number source to 36 Red Fox Pl', 'STREET/ADDRESS', 214269, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1367, 1514, 'IN PROGRESS', 'Adding Finch Corridor Trail between Yonge St and Dufferin St', 'STREET/ADDRESS', 211782, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1368, 1515, 'IN PROGRESS', 'Adding Scarborough Railpath Trail', 'STREET/ADDRESS', 211786, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1375, 1522, 'CLOSED', 'JF-LD-20 Foundry Av, December 1, 2010', 'STREET/ADDRESS', 214279, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1376, 1523, 'CLOSED', 'em-del 71, 75, 85, 123 Chesterton Shores, 125-prime; Jan 11, 2011', 'STREET/ADDRESS', 214280, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1400, 1547, 'CLOSED', 'mm-modify San Antonioway -fix loc/Cadastral', 'STREET/ADDRESS', 214293, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1401, 1548, 'IN PROGRESS', 'Adding FINCH CORRIDOR TRL from DUFFERIN ST to NORFINCH DR', 'STREET/ADDRESS', 212142, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1406, 1557, 'CLOSED', 'em-sever 16 York St; add 12 (prime-tower B, phase 1 and 14-entr, tower A, phase 2); Jan 26, 2011', 'STREET/ADDRESS', 214300, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1407, 1554, 'CLOSED', 'em-add 38 Mabelle Av; Mabelle Parkette; Jan 26, 2011', 'STREET/ADDRESS', 214299, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1408, 1555, 'HOLD', 'em-cofa for 265 Ontario St; add 264 Milan St; Jan 27, 2011; B0096/10TEY', 'STREET/ADDRESS', 212226, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1409, 1556, 'IN PROGRESS', 'em-Regent Park; split 591 Dundas St E; add 402 Shuter St (prop community), 440 Shuter Street (exist Mandela School), 591 Dundas St E-reamining); Jan 27, 2011', 'STREET/ADDRESS', 212226, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1410, 1553, 'CLOSED', 'em-add 4932 Sheppard Av E; 4930 entr; Jan 26, 2011', 'STREET/ADDRESS', 214298, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1438, 1585, 'IN PROGRESS', 'Adding bike trails to the TCL that are in the 2011 Toronto Cycling Map', 'STREET/ADDRESS', 212453, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1440, 1588, 'CLOSED', 'JF-MM-44 Ingram Dr, November 30, 2010', 'STREET/ADDRESS', 214321, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1441, 1589, 'CLOSED', 'JF-MM-56A Cameron Av, February 11, 2011', 'STREET/ADDRESS', 214322, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1442, 1587, 'CLOSED', 'JF-MM-126 York Mills Rd, October 13, 2010', 'STREET/ADDRESS', 214320, -1);
--commit;
--PROMPT 800 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1443, 1590, 'CLOSED', 'JF-LD-333 King St E, February 15, 2011', 'STREET/ADDRESS', 214323, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1461, 1608, 'CLOSED', 'ld/deleted 174-176 7 178-180 Broadway Ave-Mpac/anu', 'STREET/ADDRESS', 214336, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1462, 1609, 'CLOSED', 'JF-DM-2466 Kingston Rd, February 22, 2011', 'STREET/ADDRESS', 214337, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1464, 1611, 'IN PROGRESS', 'Adding Martin Goodman Trail parallel to LAKE SHORE BLVD W at NEWFOUNDLAND RD', 'STREET/ADDRESS', 212742, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1474, 1621, 'CLOSED', 'ld/50K-fix lanes west of Spadina Rd north of Londdale Rd down south of Montclair Ave', 'STREET/ADDRESS', 214344, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1489, 1638, 'CLOSED', 'JF-MM-45 Vansco Rd, March 11, 2011', 'STREET/ADDRESS', 214355, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1490, 1637, 'IN PROGRESS', 'JF-MM-74 Clissold Rd, March 3, 2011', 'STREET/ADDRESS', 212936, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1491, 1639, 'CLOSED', 'JF-DM-99A Hill Cr, March 15, 2011', 'STREET/ADDRESS', 214356, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1492, 1640, 'CLOSED', 'ld/51M-delete 3393-3395 Yonge St-mpac/IT-meena', 'STREET/ADDRESS', 214357, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1525, 1674, 'CLOSED', 'dm - moving addrs to correct parcels -145 to 155 Homestead Rd ', 'STREET/ADDRESS', 213162, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (25, 117, 'CLOSED', 'JF- 2 North Woodrow Blvd-Add address to an existing parcel', 'STREET/ADDRESS', 213358, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (31, 124, 'CLOSED', '16 McAdam Av assigned; Dec 3, 2008', 'STREET/ADDRESS', 200128, 200248);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (59, 153, 'CLOSED', 'mm 46K Modify 20B to 20 Duern St/SolidWaste2008/FldChkd20Dec2008', 'STREET/ADDRESS', 213379, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (69, 164, 'CLOSED', 'ld/add 52 56 to 70 Fort York Blvd-Torlet 5Dec08', 'STREET/ADDRESS', 213386, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (70, 165, 'CLOSED', 'em-5B, 7B, 9B, 11B Clarendon Av add, entr for 5 Clarendon Av; Jan 21, 2009;', 'STREET/ADDRESS', 213387, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (88, 186, 'CLOSED', null, 'STREET/ADDRESS', 213401, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (111, 212, 'CLOSED', 'mm 45K Modify 1671 Islington Ave/MPAC/FldChkd11Feb2009', 'STREET/ADDRESS', 213418, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (115, 216, 'CLOSED', 'dm - move 360 Morningside Ave to parcel 1901092022092000 - ltr Feb 24/09', 'STREET/ADDRESS', 213422, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (120, 222, 'CLOSED', 'mm 51N Modify 14,16,20 Carluke Cres(fix loc)/NYRefMap/MPAC', 'STREET/ADDRESS', 213426, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (126, 228, 'COMPLETED', 'JF - 3291-3295 Birchmount Rd - Add Nos. 1 - 22 Beswick Park Crt', 'STREET/ADDRESS', 200826, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (127, 229, 'IN PROGRESS', 'em-Feb 19, 2009, 950-976 Brimorton Dr; Curran Hall Cresc; March 3, 2009;', 'STREET/ADDRESS', 200827, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (135, 237, 'CLOSED', 'ld/53H22-Add 391 Rhodes Ave as ENTR to 389-Torlet 9Mar2009', 'STREET/ADDRESS', 213437, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (165, 277, 'CLOSED', 'mm Modify Keele St to Weston Rd-1 segm N of St Clar Ave W/By-Law', 'STREET/ADDRESS', 213460, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (166, 278, 'CLOSED', 'mm-merge Weston Rd at Keele St', 'STREET/ADDRESS', 213461, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (176, 289, 'COMPLETED', 'JF Add 5A, 5B Harding Blvd', 'STREET/ADDRESS', 201725, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (207, 320, 'CLOSED', 'ld/ Edit 20 Dorval Rd and 53-59 Edna Ave-Torlet 18Mar2009', 'STREET/ADDRESS', 213485, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (209, 322, 'CLOSED', 'dm - move 2627 McCowan Rd to correct parcel', 'STREET/ADDRESS', 213487, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (214, 327, 'CLOSED', 'ld/47M- Edit 1728 Lawrence Ave W to LSSE', 'STREET/ADDRESS', 213492, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (265, 382, 'CLOSED', 'em-assign 41 Terrace Av; May 12, 2009', 'STREET/ADDRESS', 213528, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (266, 380, 'COMPLETED', 'em-cofa 431 Rimilton Av; May 12, 2009', 'STREET/ADDRESS', 202840, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (268, 384, 'CLOSED', 'dm - delete 2002 Middlefield Rd - field check May 12/09', 'STREET/ADDRESS', 213530, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (296, 415, 'HOLD', 'em-pt of 620 Dundas St E; add 7 Oak St (prime) 9-35 Oak St; 12-40 Cole St, 100-106 Regent St; May 22, 2009; block 11', 'STREET/ADDRESS', 203124, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (297, 416, 'HOLD', 'em-pt of 620 Dundas St E; add 39 Oak St, 42 Cole St (primes) add 41-65 Oak St, 44-70 Cole St; 101-107 Regent St; June 3, 2009; block 12', 'STREET/ADDRESS', 203124, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (316, 436, 'CLOSED', 'Ld/45G-Add 36 Ourland Ave SSE to18(Park & CC)-FC9Jun 2009 / Facilities FRED / EM will attach ML', 'STREET/ADDRESS', 213567, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (410, 550, 'CLOSED', 'em-add 58 Castlefield Av; entr for 60; Sept 8, 2009', 'STREET/ADDRESS', 213648, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (411, 540, 'CLOSED', 'em-add 683 Brown''s Line; entr for 681; Sept 8, 2009', 'STREET/ADDRESS', 213641, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (412, 546, 'CLOSED', 'em-add 973 Coxwell Av; entr for 971; Sept 8, 2009', 'STREET/ADDRESS', 213904, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (413, 552, 'CLOSED', 'em-add 337 Crawford St; entr for 335; Sept 8, 2009', 'STREET/ADDRESS', 213650, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (414, 542, 'CLOSED', 'em-add 852 Brown''s Line; entr for 850; Sept 8, 2009', 'STREET/ADDRESS', 213643, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (415, 536, 'CLOSED', 'em-add 1990 Brimley Rd; Sept 8, 2009', 'STREET/ADDRESS', 213637, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (416, 551, 'CLOSED', 'em-add 4 Cross St; entr for 2 Cross St; Sept 8, 2009', 'STREET/ADDRESS', 213649, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (417, 553, 'CLOSED', 'em-add 137 Cranbrooke Av; entr for 135; Sept 8, 2009', 'STREET/ADDRESS', 213651, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (418, 538, 'CLOSED', 'em-add 9 Cardell Av; Sept 8, 2009', 'STREET/ADDRESS', 213639, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (419, 555, 'CLOSED', 'em-add 85 Burnside Dr; entr for 83; Sept 8, 2009', 'STREET/ADDRESS', 213653, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (420, 533, 'CLOSED', 'em-add 1515 Sheppard Av W; Sunfield Park; Sept 2, 2009', 'STREET/ADDRESS', 213634, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (421, 541, 'CLOSED', 'em-add 720 Brown''s Line; entr for 718; Sept 8, 2009', 'STREET/ADDRESS', 213642, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (422, 534, 'CLOSED', 'em-add 144 Sunfield Rd; city parkland; Sept 2, 2009', 'STREET/ADDRESS', 213635, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (423, 544, 'CLOSED', 'em-add 967 Coxwell Av; entr for 969; Sept 8, 2009', 'STREET/ADDRESS', 213645, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (424, 539, 'CLOSED', 'em-add 155 City View Dr; Sept 8, 2009', 'STREET/ADDRESS', 213640, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (425, 535, 'CLOSED', 'em - add entr 32 Canlish Rd; Sept 8, 2009', 'STREET/ADDRESS', 213636, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (426, 537, 'CLOSED', 'em-add entr 4471-4485 Chesswood Dr; 471-513 Champagne Dr; entr for 4469 Chesswood Dr; Sept 8, 2009', 'STREET/ADDRESS', 213638, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (427, 543, 'CLOSED', 'em-add 822 Brown''s Line ; entr for 820 ; Sept 8, 2009', 'STREET/ADDRESS', 213644, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (428, 548, 'CLOSED', 'em-add 55, 57 Cameron Av; division of 57; Sept 8, 2009', 'STREET/ADDRESS', 213906, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (429, 545, 'CLOSED', 'em-add 1014 Coxwell Av; entr for 1012; Sept 8, 2009', 'STREET/ADDRESS', 213646, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (430, 549, 'CLOSED', 'em-add 445 Carlaw Av; entr for 425; Sept 8, 2009', 'STREET/ADDRESS', 213647, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (431, 554, 'CLOSED', 'add 23 Columbus Av; entr for 21; Sept 8, 2009', 'STREET/ADDRESS', 213652, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (432, 547, 'CLOSED', 'em-add 981 Coxwell Av; entr for 979 Coxwell Av; Sept 8, 2009', 'STREET/ADDRESS', 213905, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (436, 559, 'CLOSED', 'JF-DM-Add 252 Bessborough Dr, August 25, 2009', 'STREET/ADDRESS', 213656, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (442, 565, 'CLOSED', 'ld-renumber 190A to 102 Vaughan Rd-Torlet 14Mar2005', 'STREET/ADDRESS', 213662, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (445, 568, 'CLOSED', 'mm-add Gala Lane and addresses (12 to 32)', 'STREET/ADDRESS', 213665, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (452, 575, 'CLOSED', 'em-division 330 Spadina Rd into 330 and 336; Sept 21, 09', 'STREET/ADDRESS', 213670, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (453, 577, 'CLOSED', 'em-division 79 Parkview Hill Cresc , add 5 Faircrest Circle; Sept 21, 09', 'STREET/ADDRESS', 213672, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (454, 576, 'CLOSED', 'em-add 504 St Clair Av W and 1480 Bathurst St ; entr for 510 St Clair Av W; Sept 16, 09', 'STREET/ADDRESS', 213671, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (469, 592, 'CLOSED', 'Add 121 Humber Blvd', 'STREET/ADDRESS', 213686, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (470, 593, 'CLOSED', 'dm - designate properties as ''cultural heritage'' - by-laws Oct 27/08', 'STREET/ADDRESS', 213687, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (482, 605, 'CLOSED', 'em-add 2-10 Roper Rd, entr for 10 Mendelssohn St; pt of 725 Warden Av; Oct 5, 09', 'STREET/ADDRESS', 213692, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (489, 613, 'CLOSED', 'em-add 41, 41A Lavender Rd; assign; Oct 7, 2009', 'STREET/ADDRESS', 213699, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (490, 612, 'HOLD', 'JF-LD-Add 36,38 Alfresco Lawn, March 17, 2009', 'STREET/ADDRESS', 204986, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (491, 614, 'HOLD', 'JF-LD-Add 5-11 Dunvegan Rd, March 18, 2009', 'STREET/ADDRESS', 204986, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (510, 633, 'CLOSED', 'JF-MM-Add 591 Finch Av W, October 16, 2009', 'STREET/ADDRESS', 213715, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (511, 634, 'HOLD', 'JF-MM-Add 59, 61 Giltspur Dr, October 20, 2009', 'STREET/ADDRESS', 205174, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (555, 680, 'CLOSED', 'Move 25R Queens Quay E -LIM pt 2 ON 63R-3521', 'STREET/ADDRESS', 213756, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (613, 738, 'HOLD', 'em-add 385 Silver Star Blvd, 3720 Midland Av, commerc condos, entr 3730 Midland Av; Dec 11, 09', 'STREET/ADDRESS', 205990, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (642, 769, 'CLOSED', 'em-renumber 15 Machells Av to 38 Joe Shuster Way; Jan 12, 2010', 'STREET/ADDRESS', 213811, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (643, 768, 'CLOSED', 'Re-digitize Wye Valley Rd', 'STREET/ADDRESS', 213810, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (644, 770, 'CLOSED', 'em-IGE address: 20 Joe Shuster Way; Jan 14, 2010', 'STREET/ADDRESS', 213812, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (650, 776, 'CLOSED', 'em-add 775 Broadview Av; entr for 769; Broadview Subway Station Parkette; Jan 15, 10', 'STREET/ADDRESS', 213816, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (652, 778, 'CLOSED', 'ld/ extend Tony Grande Lane', 'STREET/ADDRESS', 213817, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (668, 794, 'CLOSED', 'em-299 Coxwell Av; entr for 293; Jan 19, 2010', 'STREET/ADDRESS', 213830, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (679, 805, 'CLOSED', 'ld/ split 79-93 Flemington Rd-Mpac/ NYrefplan 17', 'STREET/ADDRESS', 213839, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (681, 807, 'CLOSED', 'dm - moving 1000 Ellesmere Rd to correct location - e-mail 2/2/2010', 'STREET/ADDRESS', 213841, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1546, 1695, 'IN PROGRESS', null, 'STREET/ADDRESS', 214511, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (695, 821, 'HOLD', 'ld/52J11-', 'STREET/ADDRESS', 206779, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (777, 905, 'CLOSED', 'JF-MM-141 Upper Canada Dr, November 19, 2009', 'STREET/ADDRESS', 213910, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (778, 906, 'HOLD', 'JF-DM-117 Harding Blvd, February 8, 2010', 'STREET/ADDRESS', 207454, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (782, 910, 'CLOSED', 'em-add 2175 Weston Rd; entr for 4 Church St (York); March 12, 2010', 'STREET/ADDRESS', 213914, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (786, 914, 'CLOSED', 'em-add 35 Grand Magazine St, entr for 65 Grand Magazine St, sales office; March 9, 2010', 'STREET/ADDRESS', 213918, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (821, 951, 'CLOSED', 'ld/47H22-switch location of 18 & 18A Dacre Cres-Torlet 24Mar2010', 'STREET/ADDRESS', 213945, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (842, 970, 'CLOSED', 'em-add 1033 Queen St W, IGE address, pt of 1001 Queen St W; April 7, 2010', 'STREET/ADDRESS', 213959, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (872, 1001, 'CLOSED', 'JF-150 Rimrock Rd and 1115 Lodestar Rd, December 24, 2009', 'STREET/ADDRESS', 208130, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (873, 1002, 'CLOSED', 'JF-74-76 Portage Av, October 26, 2009', 'STREET/ADDRESS', 213976, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (927, 1057, 'HOLD', 'em-amal 2901 and 2925 Sheppard Av East, new: 2915-Shoppers, entr: 2919-medical offices; May 3, 2010', 'STREET/ADDRESS', 208322, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (963, 1095, 'CLOSED', null, 'STREET/ADDRESS', 214028, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (973, 1106, 'CLOSED', 'em-clear range: 147-175 Barrington Av; add entr 149-173; May 26, 2010', 'STREET/ADDRESS', 214038, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (974, 1105, 'CLOSED', 'em-range 889-899 O''Connor Dr; add entr 891, 895; May 26, 2010', 'STREET/ADDRESS', 214037, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1028, 1160, 'IN PROGRESS', 'Changing one-way on Elizabeth Street Dundas Street West and a point 48 metres north thereof', 'STREET/ADDRESS', 209239, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1039, 1172, 'IN PROGRESS', 'Changing one-way on Foxbar Road from Avenue Road and a point 68.6 metres south of St Clair Avenue West', 'STREET/ADDRESS', 209281, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1044, 1179, 'CLOSED', 'mm-add 404 S 401 C W/PhotoMap2009', 'STREET/ADDRESS', 214068, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1045, 1180, 'CLOSED', 'em-renumb 414 to 412 Empress Av; June 23, 2010', 'STREET/ADDRESS', 214069, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1052, 1187, 'IN PROGRESS', 'Changing one-way on Lane first west of Lansdowne Avenue from St. Clair Avenue West and a point 50 metres south thereof', 'STREET/ADDRESS', 209338, -1);
--commit;
--PROMPT 900 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1070, 1209, 'IN PROGRESS', 'Changing one-way on Portugal Square from a point 38 metres west of Bathurst Street and Adelaide Street West', 'STREET/ADDRESS', 209462, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1071, 1210, 'IN PROGRESS', 'Changing one-way on Rhodes Avenue from a point 50 metres south of Gerrard Street East and Queen Street East', 'STREET/ADDRESS', 209465, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1076, 1215, 'IN PROGRESS', 'Changing one-way on St. Helen Avenue from Whytock Avenue and a point 99 metres south of Bloor Street West', 'STREET/ADDRESS', 209484, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1123, 1263, 'HOLD', 'JF-41 Linden Av, July 20, 2010', 'STREET/ADDRESS', 209918, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1132, 1272, 'CLOSED', 'mm-fix addr ranges at Lowbank Crt, Sparwood Crt, Mintwood Dr, Breanna Crt, Equestrian Crt, Osmund Crt/Inhouse', 'STREET/ADDRESS', 214100, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1133, 1273, 'HOLD', 'JF-43 Foch Av, August 3, 2010', 'STREET/ADDRESS', 210006, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1138, 1279, 'HOLD', 'JF-194 Cameron Av, July 27, 2010', 'STREET/ADDRESS', 210045, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1139, 1281, 'CLOSED', 'JF-13 Gresham Rd, August 10, 2010', 'STREET/ADDRESS', 214105, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1140, 1280, 'HOLD', 'JF-165 First Av, July 27, 2010', 'STREET/ADDRESS', 210045, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1163, 1304, 'CLOSED', 'mm-Close Ln S Morningside E South Kingsway(no vehicle access)/EMS/FldChkd-19May2010', 'STREET/ADDRESS', 214124, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1193, 1334, 'HOLD', 'JF-300 Aylesworth Av, August 27, 2010', 'STREET/ADDRESS', 210435, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1194, 1335, 'CLOSED', 'JF-1736 Avenue Rd, August 23, 2010', 'STREET/ADDRESS', 214141, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1211, 1353, 'IN PROGRESS', 'Adding One-way westbound on Lane first north of King Street West between John Street and Widmer Street', 'STREET/ADDRESS', 210567, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1277, 1421, 'CLOSED', 'ld/47Q-deleting range 367-401 Driftwood Ave-dup_range_addr(25)/mpac', 'STREET/ADDRESS', 214201, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1283, 1428, 'CLOSED', 'ld/52H-fix segments Ln N Dudnas W Logan; Ln w Logan S Dundas-cadastral', 'STREET/ADDRESS', 214207, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1308, 1455, 'CLOSED', 'em-add 238 Staines Rd; Nov 17, 2010', 'STREET/ADDRESS', 214227, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1349, 1496, 'HOLD', 'em-add 195 Queen St E; former 193, 195-commerc and offices, 28 Britain St for res; Dec 23, 2010', 'STREET/ADDRESS', 211687, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1379, 1526, 'CLOSED', 'ld/60N11Added 21 Archimedes Crt (was 125 Zaph Ave in Mpac)as per ML & req by MeenaJan2011', 'STREET/ADDRESS', 214282, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1383, 1530, 'CLOSED', 'ld/50J-Delete ranged 1187-1189 Bathurst St-notin mpac', 'STREET/ADDRESS', 214284, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1403, 1550, 'CLOSED', 'ld/48J21-edit segments on Dundas St W & Indian Grv/Rd & vicinity', 'STREET/ADDRESS', 214295, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1414, 1561, 'CLOSED', 'ld/Add 2131, delete 2121-2131 & 2125-2131 Jane St-Torlet2Feb2011', 'STREET/ADDRESS', 214303, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1420, 1567, 'CLOSED', 'JF-MM-555 Petrolia Rd, Apollo Way, September 20, 2010', 'STREET/ADDRESS', 214307, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1430, 1577, 'HOLD', 'JF-MM-Add 3A and 3B Marquis Av, February 1, 2011', 'STREET/ADDRESS', 212402, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1431, 1579, 'CLOSED', 'JF-LD-31-67 Saulter St, 1 Strange St, February 11,  2011', 'STREET/ADDRESS', 212505, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1432, 1578, 'CLOSED', 'JF-MM-12 Rivalda Rd, February 4, 2011', 'STREET/ADDRESS', 214315, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1446, 1595, 'CLOSED', 'JF-MM-14 Clairtrell Rd, February 9, 2011', 'STREET/ADDRESS', 214326, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1447, 1597, 'CLOSED', 'JF-DM-38 Tideswell Blvd, January 28, 2011', 'STREET/ADDRESS', 214328, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1448, 1594, 'IN PROGRESS', 'JF-LD-2170 Gerrard St E, January 21, 2011', 'STREET/ADDRESS', 212576, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1449, 1593, 'CLOSED', 'JF-MM-4 Colvestone Rd, January 21, 2011', 'STREET/ADDRESS', 214325, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1450, 1598, 'HOLD', 'JF-DM-232-234 Galloway Rd, February 18, 2011', 'STREET/ADDRESS', 212576, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1451, 1596, 'CLOSED', 'JF-DM-34 Gillingham St, January 21, 2011', 'STREET/ADDRESS', 214327, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1452, 1599, 'CLOSED', 'dm - moving addrs to fix range -155 to 173B Galloway Rd - SC ltr/ map 59L-21 - Aug 25/2010 ', 'STREET/ADDRESS', 214329, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1456, 1605, 'CLOSED', 'em-add 130 Arrow Rd; entr for 122; Feb 18, 2011', 'STREET/ADDRESS', 214334, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1457, 1607, 'CLOSED', 'em-add 79, 81 Jonesville Cr; Feb 24, 2011', 'STREET/ADDRESS', 214335, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1458, 1603, 'CLOSED', 'em-range 182-250 Brenyon Way; Feb 22, 2011', 'STREET/ADDRESS', 214333, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1459, 1606, 'COMPLETED', 'em-cofa for 39, add 41 Beath St; Feb 18, 2011', 'STREET/ADDRESS', 212613, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1460, 1604, 'COMPLETED', 'em-add split whole lots, add 5 and 7 Commonwealth Av; Feb 18, 2011', 'STREET/ADDRESS', 212613, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1473, 1620, 'CLOSED', 'dm - change PRIME 133 Manville Rd to ENTR for 55 Civic Rd - MPAC ltr Mar 02/11', 'STREET/ADDRESS', 214343, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1477, 1625, 'CLOSED', null, 'STREET/ADDRESS', 214346, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1482, 1630, 'CLOSED', 'dm - moving addresses to correct parcels - SC ltr Aug 21/2010', 'STREET/ADDRESS', 214350, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1483, 1631, 'CLOSED', 'mm-Gulfstream Rd, Verobeach Blvd fix addr loc/cadastral', 'STREET/ADDRESS', 214351, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1486, 1634, 'IN PROGRESS', 'JF-LD-346 Jarvis St, August 21, 2009, March 14, 2011', 'STREET/ADDRESS', 212899, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1503, 1653, 'IN PROGRESS', 'em-add 84B Rosemount Av; entr for 84; March 14, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1504, 1662, 'COMPLETED', 'em-add 2167 Lake Shore Blvd West, entr for 2165; March 10, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1505, 1664, 'IN PROGRESS', 'em-add 25 Rees St; pt of 255 Bremner Blvd; March 9, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1506, 1663, 'IN PROGRESS', 'em-omb for 194 Burnett Av; add 196; March 10, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1507, 1656, 'CLOSED', 'em-range 119-123 Manville Rd, add 123; March 14, 2011', 'STREET/ADDRESS', 214362, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1508, 1659, 'IN PROGRESS', 'em-cofa/convey for 265-303 Queen''s Dr and 1779R Jane St; March 14, 2011; B72/10EYK', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1509, 1652, 'IN PROGRESS', 'em-add 470 Bloor St W; entr for 468; March 14, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1510, 1654, 'CLOSED', 'em-add 80 Rosemount Av; entr for 83 Glenholme Av; March 14, 2011', 'STREET/ADDRESS', 214360, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1511, 1655, 'CLOSED', 'em-range 127-133 Manville Rd; March 14, 2011', 'STREET/ADDRESS', 214361, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1512, 1657, 'CLOSED', 'em-assign 29 Civic Rd; March 14, 2011', 'STREET/ADDRESS', 214363, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1513, 1658, 'IN PROGRESS', 'em-add 20 John St, res condo, prime-300 Front St W-res condo; March 17, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1514, 1661, 'IN PROGRESS', 'em-cofa for 31 Northern Place; add 49A, 49B, 49C Shirley St; March 16, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1515, 1660, 'IN PROGRESS', 'em-add 33 Gould St, entr for 122 Bond St; March 16, 2011', 'STREET/ADDRESS', 213036, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (27, 119, 'CLOSED', 'JF - Add 23 Willowlea Dr', 'STREET/ADDRESS', 213360, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (34, 127, 'CLOSED', '1155 Lake Shore Blvd East-entr for 1313 Lake Shore Blvd E; lett Nov 27, 2008;', 'STREET/ADDRESS', 213362, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (47, 141, 'CLOSED', '47K-Move and modify 28 Gunns Rd to SE of 30 Gunns Rd', 'STREET/ADDRESS', 213367, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (51, 145, 'CLOSED', 'mm 46J Modify 10,12,16 Old Mill Trl/BellCan,FldChkd20Jan2009/MPAC', 'STREET/ADDRESS', 213371, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (55, 149, 'CLOSED', 'mm 47M Modify 338,340 Falstaff Ave(loc,f.code)/Let-NyLet-6Jan2009', 'STREET/ADDRESS', 213375, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (101, 200, 'CLOSED', 'mm- 52J Move 15 Jackman Ave(fix loc)/MPAC', 'STREET/ADDRESS', 213412, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (106, 207, 'CLOSED', 'JF - Add 857 Dupont St as Structure Entrance for 1051 Ossingon Ave ', 'STREET/ADDRESS', 213414, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (130, 232, 'CLOSED', 'em-March 4, 2009, 26A Bywood Dr; Islington Heights Park;', 'STREET/ADDRESS', 213432, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (136, 238, 'CLOSED', 'mm 56Q Modify 201Alexmuir Blvd to Alexmuir Blvd(21 arcs)/PropDataMap', 'STREET/ADDRESS', 213438, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (153, 256, 'CLOSED', 'ld/48J-Edit Ln W Old Weston S St Clair Avenue to Browns Lane-Plan M160/BH emailed 12Mar2009', 'STREET/ADDRESS', 213452, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (155, 263, 'HOLD', 'em-CofA-100 Queen''s Park; March 18, 2009, add 90 and 100 Queen''s Park;', 'STREET/ADDRESS', 201368, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (194, 307, 'HOLD', 'JF - Add/Re-add 6A, 6B, 8 Glen Rush Blvd ', 'STREET/ADDRESS', 201959, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (233, 346, 'CLOSED', 'JF-DM-Add 6 Gower St / 12A, 12B Gower St / re-digitize Captain Demont Lane and add addrs - 7 to 25.Captain Demont Lane/also add 442 to 456 Dawes Rd./ Torlet Feb 18 /09', 'STREET/ADDRESS', 213503, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (247, 362, 'CLOSED', 'em- add 90 Beechgrove Dr, entr for 100 Beechgrove Dr; April 28, 2009', 'STREET/ADDRESS', 213515, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (271, 387, 'CLOSED', 'ld/ digitize WW E William R Allen S Elm Ridge-Plan63R-3352/Apset 49L12W1', 'STREET/ADDRESS', 213531, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (317, 437, 'CLOSED', 'JF-MM-Add Nos. 50 Wilson Hts Blvd, 30 Tippet Rd, 75 Billy Bishop Way ' || chr(13) || '' || chr(10) || 'April 3, 2009' || chr(13) || '' || chr(10) || '', 'STREET/ADDRESS', 213568, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (323, 443, 'CLOSED', 'Ld/49J22-Added 521 525 & 527 Melita Cres-Bins/Limm/Mpac', 'STREET/ADDRESS', 213572, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (330, 450, 'IN PROGRESS', 'em-former 2077 Lake Shore Blvd W; res condo 3 Marine Parade Dr, comm condo 2069 Lake Shore Blvd W; Aug 5, 2009', 'STREET/ADDRESS', 203530, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (351, 471, 'CLOSED', 'JF-LD-Reserve 390 Kingston Rd at 55 Corley Av, Letters: June 8, 2009 and August 21, 2009.', 'STREET/ADDRESS', 213588, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (390, 515, 'CLOSED', 'em-add 47 Aspenwood Dr; Aug 26, 2009', 'STREET/ADDRESS', 213620, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (391, 514, 'CLOSED', 'em-add 3457 Bathurst St, entr for 3453 Bathurst St; Aug 26, 2009', 'STREET/ADDRESS', 213619, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (392, 512, 'CLOSED', 'em-add 5986 Bathurst St; entr for 5968; Aug 26, 2009;', 'STREET/ADDRESS', 213617, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (393, 519, 'CLOSED', 'em-sever 76 and 78 Belmont St; add 78; Aug 26, 2009', 'STREET/ADDRESS', 213624, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (394, 516, 'CLOSED', 'em-add 3573-3609 Sheppard Av E and 2246-2264 Birchmount Rd, entr for 3571 Sheppard Av E; Aug 26, 2009', 'STREET/ADDRESS', 213621, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (395, 517, 'CLOSED', 'em-renum 89R Ossington Av to 40 Argyle Pl; Aug 26, 2009', 'STREET/ADDRESS', 213622, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (396, 513, 'CLOSED', 'em-add 3543 Bathurst St, entr for 3541 Bathurst St; Aug 26, 2009', 'STREET/ADDRESS', 213618, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (397, 518, 'CLOSED', 'em-sever 174 Bedford Rd, add 174 and 176; Aug 26, 2009', 'STREET/ADDRESS', 213623, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (451, 574, 'CLOSED', 'Ld/Del 832-834; add 834 (SE) to 832 Dundas St W /planning-amalik/em/Mpac', 'STREET/ADDRESS', 213669, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (479, 602, 'CLOSED', 'em-revision; add 2 Drummond Pl, entr for 328 Adelaide St W; delete 50 Drummond Pl; Oct 2, 09', 'STREET/ADDRESS', 213690, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (502, 625, 'CLOSED', 'mm-1 to 178 Rusty Crestway-fix loc/NYRefMap', 'STREET/ADDRESS', 213708, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (528, 659, 'CLOSED', 'em-add 8 Eastwood Rd; entr for 255 Coxwell Av; Oct 15, 09', 'STREET/ADDRESS', 213738, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (529, 662, 'CLOSED', 'em-add 481 Duplex Av; entr for 479; Oct 15, 09', 'STREET/ADDRESS', 213741, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (530, 665, 'CLOSED', 'em-add 848 Davenport Rd; entr for 846; Oct 16, 09', 'STREET/ADDRESS', 213744, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (531, 667, 'CLOSED', 'em-add 574 Dufferin St; entr for 576; Oct 16, 09', 'STREET/ADDRESS', 213746, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (532, 664, 'CLOSED', 'em-add 2149 Danforth Av; entr for 2151; Oct 16, 09', 'STREET/ADDRESS', 213743, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (533, 660, 'CLOSED', 'em-add 918 Eglinton Av West, entr for 914; Oct 15, 09', 'STREET/ADDRESS', 213739, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (534, 658, 'CLOSED', 'em-add 112 Edgewood Av; sever of 114; Oct 15, 09', 'STREET/ADDRESS', 213736, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (535, 661, 'CLOSED', 'em-add 276 Eglinton Av West, entr for 278; Oct 15, 09', 'STREET/ADDRESS', 213740, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (536, 651, 'CLOSED', 'em-add 659 Danforth Av; entr for 671; Oct 19, 09', 'STREET/ADDRESS', 213729, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (537, 657, 'CLOSED', 'em-add 87, 89 Duggan Av; entr for 31 Oriole Parkway; Oct 15, 09', 'STREET/ADDRESS', 213735, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (538, 666, 'CLOSED', 'em-add 622A, 624 Dovercourt Rd; entr for 622; Oct 16, 09', 'STREET/ADDRESS', 213745, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (539, 663, 'CLOSED', 'em-add 339 Danforth Av; entr for 337; Oct 16, 09', 'STREET/ADDRESS', 213742, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (540, 653, 'CLOSED', 'em-add 153 Dupont St; entr for 149; Oct 15, 09', 'STREET/ADDRESS', 213731, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (541, 656, 'CLOSED', 'em-add 24 Fairview Av; entr for 39 Woodsie Av; Oct 15, 09', 'STREET/ADDRESS', 213734, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (542, 652, 'CLOSED', 'em-add 1151 Dupont St; entr for 1149; Oct 15, 09', 'STREET/ADDRESS', 213730, -1);
--commit;
--PROMPT 1000 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (543, 668, 'CLOSED', 'em-add 530 Danforth Av; entr for 532;Oct 19, 09', 'STREET/ADDRESS', 213747, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (544, 655, 'CLOSED', 'em-add 3349 Dundas Street West; entr for 3347; Oct 15, 09', 'STREET/ADDRESS', 213733, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (601, 726, 'CLOSED', 'Ld-Move 90 to 92 Medland Cres', 'STREET/ADDRESS', 213785, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (637, 763, 'CLOSED', 'ld/ Added 65A Rockcliffe Blvd. ML will be added by EM', 'STREET/ADDRESS', 213806, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (662, 788, 'CLOSED', 'ld/46G21-add 40 as Entrance to 38 Superior Ave-Torlet 22Jan2010/FC/SW', 'STREET/ADDRESS', 213826, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (678, 804, 'CLOSED', 'ld?54J-Move loc of 366 Main St (dual mun) fr TO to EY -cadastral/assmt-Mpac/IT meena', 'STREET/ADDRESS', 213838, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (705, 831, 'CLOSED', 'dm - adding 4665 Steeles Ave E ; moving 4675 to correct parcel - torlet Jun 02/09/Map 56Q', 'STREET/ADDRESS', 213856, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (717, 844, 'CLOSED', 'ld/adding Stanley Public School to 75 Stanley Rd-Election/FC 21Dec07', 'STREET/ADDRESS', 213863, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (750, 877, 'CLOSED', 'mm-del CNR non-existing segm at Beltline Trl/Bowie Ave', 'STREET/ADDRESS', 213886, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (792, 920, 'CLOSED', 'ld/-fix Stonecutters Lane-cadastral', 'STREET/ADDRESS', 213922, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (805, 933, 'CLOSED', 'ld/50H22-edit intesections/centrelines for laneways S-Bloor St W; E-Spadina Ave; N-Harbord St; W-St George St-cadastral', 'STREET/ADDRESS', 213930, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (843, 973, 'CLOSED', 'mm-del 5383 Yonge St, modify 20 Church St(STR to PRM)/NYLet-7Jul2006', 'STREET/ADDRESS', 213961, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (878, 1010, 'HOLD', 'JF-4 Violet Av, November 26, 2009', 'STREET/ADDRESS', 208151, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (879, 1008, 'CLOSED', 'JF-888 Cosburn Av, February 11, 2010', 'STREET/ADDRESS', 213979, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (880, 1009, 'CLOSED', 'JF-888 Cosburn Av, April 20, 2010', 'STREET/ADDRESS', 213980, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (890, 1020, 'CLOSED', '55N-edit 2075 Warden Av to Avenue (5 segments)-cadastral', 'STREET/ADDRESS', 213987, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (891, 1022, 'HOLD', 'JF-18 Red Deer Av, April 8, 2010', 'STREET/ADDRESS', 208206, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (892, 1023, 'HOLD', 'JF-25 Natal Av, March 26, 2010', 'STREET/ADDRESS', 208206, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (893, 1021, 'CLOSED', 'JF-51 Hanna Av, February 19, 2010', 'STREET/ADDRESS', 213988, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (958, 1090, 'HOLD', 'JF-1239-1247 Avenue Rd, May 10, 2010', 'STREET/ADDRESS', 208721, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (990, 1122, 'CLOSED', 'em-amal 357, 359 Cortleigh Blvd, into 357; June 7, 2010', 'STREET/ADDRESS', 214046, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (991, 1123, 'CLOSED', 'em-to assmt, 787, 803 King St W; June 4, 2010', 'STREET/ADDRESS', 214047, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (992, 1125, 'HOLD', 'em-reserv 1 Old Mill Dr for res condo, 2490 Bloor St W for commer condo; June 7, 2010', 'STREET/ADDRESS', 208960, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (993, 1124, 'HOLD', 'em-reserv 2 Old Mill Dr; res condo, former 2500 Bloor St W; June 7, 2010', 'STREET/ADDRESS', 208960, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1029, 1162, 'IN PROGRESS', 'Changing one-way on SUNLIGHT PARK RD   - Eastern Avenue (south roadway) Eastern Avenue (re-aligned) and a point 15.2 metres west (vicinity of Lewis Street)', 'STREET/ADDRESS', 209246, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1030, 1163, 'CLOSED', 'dm - move ENTR 2632 Eglinton Ave E to PRIME 2630 - MPAC ltr Jun 21/10', 'STREET/ADDRESS', 214062, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1034, 1167, 'IN PROGRESS', 'Changing one-way on Euclid Avenue from a point 62 metres north of Bloor Street West and Follis Avenue', 'STREET/ADDRESS', 209272, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1035, 1168, 'CLOSED', 'em-amal 367 and 369 Cortleigh Blvd into 369; del 367; June 16, 2010', 'STREET/ADDRESS', 214064, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1079, 1218, 'IN PROGRESS', 'Changing one-way on St. Patrick St from Dundas Street West and a point 28.0 metres north thereof', 'STREET/ADDRESS', 209495, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1082, 1221, 'IN PROGRESS', 'Changing one-way on Bellevue Avenue from Wales Avenue and a point 35.7 metres south of College Street', 'STREET/ADDRESS', 209514, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1084, 1224, 'CLOSED', '49G23-Move 839 to 855 Richmond St W & 199 Stafford St-Torlet 2Jan2008/mpac', 'STREET/ADDRESS', 214084, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1085, 1225, 'HOLD', 'JF-4 Queensbury Av, July 6, 2010', 'STREET/ADDRESS', 209538, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1086, 1226, 'CLOSED', 'JF-112 Elm Ridge Dr, June 25, 2010', 'STREET/ADDRESS', 214085, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1099, 1239, 'HOLD', 'JF-84 Twenty Fourth St, July 8, 2010', 'STREET/ADDRESS', 209665, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1100, 1240, 'CLOSED', 'JF-47 Ardmore Rd, July 8, 2010', 'STREET/ADDRESS', 214093, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1111, 1251, 'CLOSED', 'em-add 125 Birmingham St; entr for 55 Etta Wylie Rd; July 19, 2010', 'STREET/ADDRESS', 213347, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1164, 1305, 'CLOSED', 'em-renum 41 to 39B Wharfside La; Aug 10, 2010', 'STREET/ADDRESS', 214125, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1165, 1306, 'HOLD', 'em-555 Midland Av (bldg 2) entr 557-567 Midland Av; bldg 1-3648 St Clair Av E , entr 3650-3668 and 3 freehold : 25, 27 and 29 Olga St; Aug 13, 2010', 'STREET/ADDRESS', 210182, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1187, 1328, 'IN PROGRESS', 'Removing one-way on Oeefe Lane from A point 15.2 metres north of Gould Street and Gerrard Street East; Adding one-way on Gould Street from Bond Street and Church Street', 'STREET/ADDRESS', 210401, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1212, 1354, 'IN PROGRESS', 'Changing Vaughan Road right turn channel (from Oakwood Avenue)between the east limit of Oakwood Avenue and the south limit of Vaughan Road from a two-way to an eastbound one-way', 'STREET/ADDRESS', 210574, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1213, 1355, 'CLOSED', 'ld/51G23-Delete Trinity St south of Mill St(Distillery 55 Mill St)as per letter/BHall/FC/gcc', 'STREET/ADDRESS', 214153, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1251, 1395, 'CLOSED', 'mm-Modify Robinhood Rd to Robin Hood Rd/Plan No 2971 Feb 6,1940/Plan No 3477/1947/By-Law 8243', 'STREET/ADDRESS', 214179, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1267, 1411, 'CLOSED', 'em-add 256 Ingleton Bvld; Oct 13, 2010; pt of Milliken park, city owned separate roll;', 'STREET/ADDRESS', 214192, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1268, 1412, 'CLOSED', 'em-add 246 Rustic Rd, entr for 320 Culford Rd, Maple Leaf Park; Oct 14, 2010', 'STREET/ADDRESS', 214193, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1293, 1441, 'HOLD', 'em-cofa for 183 Finch Av E; add 183A; Nov 4, 2010', 'STREET/ADDRESS', 211162, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1294, 1440, 'CLOSED', 'em-add 38 Pitt Av; Nov 4, 2010', 'STREET/ADDRESS', 214215, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1295, 1439, 'CLOSED', 'em-add 18 Duncan St, entr for 20; Nov 4, 2010', 'STREET/ADDRESS', 214214, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1326, 1473, 'CLOSED', 'ld/50H-renumber 16 to 18 St Thomas St-Torlet 24Dec98/JF/Winterliciuous', 'STREET/ADDRESS', 214245, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1335, 1482, 'CLOSED', 'em-add 80 Valleybrook Dr, entr for 100; Dec 11, 2010', 'STREET/ADDRESS', 214252, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1362, 1511, 'CLOSED', 'JF-DM-12 Cosens St, September 25, 2009', 'STREET/ADDRESS', 214275, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1363, 1509, 'HOLD', 'JF-DM-517 Birchmount Rd, December 8, 2009', 'STREET/ADDRESS', 211755, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1364, 1510, 'CLOSED', 'JF-DM-1,51 Prudential Drive, March 11, 2010', 'STREET/ADDRESS', 214274, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1371, 1521, 'CLOSED', 'JF-DM-70 Ferguson St, January 10, 2010', 'STREET/ADDRESS', 214278, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1372, 1520, 'HOLD', 'JF-MM-973 Glencairn Av, January 11, 2011', 'STREET/ADDRESS', 211817, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1373, 1518, 'CLOSED', 'JF-MM-26A-26B Lobo Mews, August 21, 2009', 'STREET/ADDRESS', 214276, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1374, 1519, 'CLOSED', 'JF-MM-741 Sheppard Av W, February 12, 2010', 'STREET/ADDRESS', 214277, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1385, 1532, 'CLOSED', 'ld/54H11-Del ranged 535-537 & 535A-537 Kignston Rd; add 535B & 537B-FC 20Dec2010.ML doc added by EM', 'STREET/ADDRESS', 214286, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1386, 1533, 'CLOSED', null, 'STREET/ADDRESS', 212035, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1434, 1581, 'HOLD', 'em-2256-2270 Lawrence Av; sever into: 1A-1F Bowsprit Av, 55A-59B Westona St; 6-semis; Feb 11, 2011', 'STREET/ADDRESS', 212420, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1435, 1582, 'HOLD', 'em-68 Abell St, new res condo, former 48; remain-180 Sudbury St-rental bldg; Feb 11, 2011', 'STREET/ADDRESS', 212420, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1439, 1586, 'CLOSED', 'bh - correction to Queens Plate Dr', 'STREET/ADDRESS', 214319, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1463, 1610, 'CLOSED', null, 'STREET/ADDRESS', 214338, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1470, 1618, 'IN PROGRESS', 'Converting portion of Raglan Ave to one-way from St. Clair' || chr(13) || '' || chr(10) || 'Avenue West to a point 56.4 metres north', 'STREET/ADDRESS', 212769, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1471, 1619, 'IN PROGRESS', 'Implementing a one-way northbound regulation in first lane east of Beverley Street from Cecil Street to a point 22.2 metres north', 'STREET/ADDRESS', 212769, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1478, 1628, 'CLOSED', 'JF-MM-2 - 10 Helen Av, February 17, 2011', 'STREET/ADDRESS', 214349, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1479, 1629, 'COMPLETED', 'JF-DM-2 - 16 Dale Av, November 24, 2010', 'STREET/ADDRESS', 212846, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1480, 1626, 'CLOSED', 'JF-LD-68 Yorkville Av, March 7, 2011', 'STREET/ADDRESS', 214347, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1481, 1627, 'CLOSED', 'JF-LD-250 Front St W, February 23, 2011', 'STREET/ADDRESS', 214348, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1495, 1646, 'HOLD', 'JF-MM-4286-4288 Lawrence Av E, January 28, 2011', 'STREET/ADDRESS', 212985, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1496, 1644, 'IN PROGRESS', 'JF-MM-77 Sixteenth St, January 26, 2011', 'STREET/ADDRESS', 212985, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1497, 1645, 'HOLD', 'JF-MM-23 Kingdom St, January 26, 2011', 'STREET/ADDRESS', 212985, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1522, 1671, 'COMPLETED', 'mm-10 Harlandale Ave fix addr loc/NyLet-Mar01/1994', 'STREET/ADDRESS', 213149, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (13, 102, 'HOLD', null, 'STREET/ADDRESS', 200012, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (28, 121, 'HOLD', '201 Carlaw Ave, 34 to 52 (excpt 48) Boston Ave-Tletr 11Dec2008', 'STREET/ADDRESS', 200118, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (40, 134, 'CLOSED', 'JF-70MinukAcres- Add Address to exsiting parcel', 'STREET/ADDRESS', 213365, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (50, 143, 'CLOSED', null, 'STREET/ADDRESS', 213369, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (58, 152, 'CLOSED', 'mm 45K Modify 1668 Islington Ave(f.cod, loc, add name)', 'STREET/ADDRESS', 213378, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (67, 161, 'IN PROGRESS', 'em-1717 Avenue Rd, amal, res/comm condo-May 28, 2007;Sept 30, 2008;Jan 20, 2009;', 'STREET/ADDRESS', 200337, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (78, 174, 'CLOSED', 'ld-move 718R Ossington Ave', 'STREET/ADDRESS', 213395, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (79, 175, 'CLOSED', 'ld/50J11- Mod SE 9 Howland Ave to LSSE, 11 to SE of 9, del range 5-11 Howland Ave-Torlet 27Jan09', 'STREET/ADDRESS', 213396, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (113, 214, 'CLOSED', 'mm 43Q Split,move segm,unsplit Marlebon Rd(fix mixed addr range)', 'STREET/ADDRESS', 213420, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (118, 219, 'HOLD', 'JF-Add 1A & 1B Carluke Cr', 'STREET/ADDRESS', 200706, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (148, 252, 'HOLD', 'em-OMB-4Astoria Av, add 1A, 1B, 1C, 1D Elhurst Crt; March 12, 2009;', 'STREET/ADDRESS', 201184, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (149, 251, 'CLOSED', 'em-add 53 Guided Crt, entr for 55 Guided Crt; March 13, 2009;', 'STREET/ADDRESS', 213449, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (157, 269, 'CLOSED', 'em-cpr-700, 720, 730 Mt.Pleasant Rd; March 19, 2009;', 'STREET/ADDRESS', 213455, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (171, 284, 'CLOSED', null, 'STREET/ADDRESS', 213465, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (177, 290, 'HOLD', 'JF-MM-Amalgamation-Condo-872-878SheppardAvW-20090326.pdf', 'STREET/ADDRESS', 201731, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (178, 291, 'CLOSED', 'Add 46 Centre Av as per JF-Renumber-44CentreAv-20090327.pdf', 'STREET/ADDRESS', 213469, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (191, 304, 'HOLD', 'JF - Add No. 97 London St ', 'STREET/ADDRESS', 201935, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (205, 318, 'COMPLETED', 'Changing section of Lauder Ave from one-way to two-way at St Clair Ave W.', 'STREET/ADDRESS', 202117, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (210, 323, 'CLOSED', 'dm - adding intersection - McDonald Ave to delete connectivity to Burn Hill Rd', 'STREET/ADDRESS', 213488, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (241, 355, 'CLOSED', null, 'STREET/ADDRESS', 202505, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (359, 480, 'HOLD', 'JF-MM- Reallocate 21 and 23 Roycrest Av, add 370 Sheppard Av W, April 24, 2009 and Allocate 21A, 21B, September 20, 2010', 'STREET/ADDRESS', 203918, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (360, 481, 'CLOSED', 'em-add 59-131 Balliol St; Aug 25, 2009', 'STREET/ADDRESS', 213594, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (365, 486, 'HOLD', 'Mimico Linear Park file supplied by TRCA.', 'STREET/ADDRESS', 203986, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (383, 505, 'CLOSED', 'em- add amd address 10 Viking La; Sept 1, 09', 'STREET/ADDRESS', 213610, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (612, 737, 'CLOSED', 'ld/added 285 to 291 Jarvis St-ML , in LIM and field check;', 'STREET/ADDRESS', 213795, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (632, 758, 'CLOSED', 'dm - moving 777 Bayview Ave to TOR segment', 'STREET/ADDRESS', 213801, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (641, 767, 'HOLD', 'em-split 25, add 15 (future dev), 29 (res condo), 39 (res condo) Queens Quay E; Jan 11, 2010', 'STREET/ADDRESS', 206175, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (645, 771, 'HOLD', 'em-add 20 Joe Shuster Way (incl unnumber land) - res condo, 1112 King St W (retail unit), 26, 30 Joe Shuster Way, retail units, Jan 12, 2010', 'STREET/ADDRESS', 206190, -1);
--commit;
--PROMPT 1100 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (647, 773, 'COMPLETED', 'Adding COLONEL SAMUEL SMITH PARK TRAIL', 'STREET/ADDRESS', 206200, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (666, 792, 'CLOSED', 'dm - re-digitize  and add addrs - Staines Rd / Tait Crt / Rivitt Pl/ Palk Lane - Torlet Aug21/09', 'STREET/ADDRESS', 213829, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (674, 800, 'HOLD', 'JF-LD-Add 28 Euclid Av, January 19, 2010', 'STREET/ADDRESS', 206470, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (692, 817, 'HOLD', 'em-reassigned 21 Widmer St (res condo), 31 Widmer St (prop community space) , 299 Adelaide St W (prop retail); Feb 8, 2010', 'STREET/ADDRESS', 206730, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (693, 816, 'HOLD', 'em-cofa 544 Birchmount Rd, add 550 Birchmount Rd; Feb 8, 2010', 'STREET/ADDRESS', 206730, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (694, 818, 'HOLD', 'em-add 17 Kenaston Gdns (prop res condo), 25 Kenaston Gdns (retail), Feb 8, 2010', 'STREET/ADDRESS', 206730, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (735, 862, 'CLOSED', 'ld/50K21-Merge 115 & 111 Richview Ave, then sever to 109, 111, 115 Richview Ave-Torlet 25May2009 for JF/; to close Source as new parcels are in OAR/iMaint', 'STREET/ADDRESS', 213878, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (741, 868, 'IN PROGRESS', 'Renaming portion of HUMBER BAY PARK EAST TRL to MARTIN GOODMAN TRL and Waterfront Trl', 'STREET/ADDRESS', 207141, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (748, 876, 'HOLD', 'em-cofa; add 80, 82 Cranbrooke Av; tech; Feb 19, 2010', 'STREET/ADDRESS', 207174, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (749, 875, 'HOLD', 'em-cofa; 123 Whitfield Av; add 123 Whitfield Av and 45 Emily Av; Feb 19, 2010', 'STREET/ADDRESS', 207174, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (784, 912, 'CLOSED', 'em-assmt, range 16-20, March 9, 2010', 'STREET/ADDRESS', 213916, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (818, 948, 'HOLD', 'ld/45F22- severed 1 Toffee Crt to 1 & 1A Toffee Crt- Torlet 4June2009 for JF', 'STREET/ADDRESS', 207775, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (832, 960, 'CLOSED', 'ld/52H11- Add 34 to 44 Hamilton St, ENTR to 33 Munro St-Torlet 01Aug2008/FC29Mar2010', 'STREET/ADDRESS', 213953, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (833, 961, 'CLOSED', 'ld/52H11-Edit to fix Munro St, Kintyre Ave, laneways on properties known as 825 Dundas St E-FC29Mar2010', 'STREET/ADDRESS', 213954, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (865, 993, 'CLOSED', 'JF-29 Fima Cr, November 30, 2009 ', 'STREET/ADDRESS', 213971, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (866, 995, 'HOLD', 'JF-185 Beta Av, November 30, 2009', 'STREET/ADDRESS', 208073, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (867, 994, 'CLOSED', 'JF-21 Damask Av, September 14, 2009', 'STREET/ADDRESS', 213972, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (877, 1007, 'HOLD', 'ld/-sever 51 Montressor Dr to 51 & 6 Toba Dr-Torlet 12June2009 for JF', 'STREET/ADDRESS', 208142, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (885, 1017, 'CLOSED', 'JF-20 Ted Rogers Way, March 24, 2010', 'STREET/ADDRESS', 213985, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (886, 1015, 'HOLD', 'JF-67 Florence Av, October 5, 2009', 'STREET/ADDRESS', 208180, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (887, 1016, 'HOLD', 'JF-642-650 King St W, September 18, 2009', 'STREET/ADDRESS', 208180, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (904, 1034, 'CLOSED', 'mm-Modify PlannBndry back to Ln N Annette E Beresford/PhotoMap2009/Cadastral', 'STREET/ADDRESS', 213992, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (905, 1035, 'CLOSED', 'ld edit 100 Burrows Hall Bv to Blvd', 'STREET/ADDRESS', 213993, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (955, 1088, 'HOLD', 'em-add 100 Harrison Garden Blvd (tower A and B), add 120 Harrison Garden Blvd (tower C), add 130 Harrison Garden Blvd (tower D), June 27, 2007 and Jan 16, 2008', 'STREET/ADDRESS', 208706, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (956, 1087, 'HOLD', 'em-add 5, 7, 9 Oakburn Cres, 115 Harrison Garden Blvd (towns), add 105 Harrison Garden Blvd (tower), add 125 Harrison Garden Blvd (park); June 27, 2007', 'STREET/ADDRESS', 208706, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1019, 1151, 'IN PROGRESS', 'Changing one-way on Chester Avenue from a point 92 metres north of Danforth Avenue and Browning Avenue', 'STREET/ADDRESS', 209197, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1021, 1154, 'CLOSED', 'em-add 520R Old Weston Rd; June 18, 2010', 'STREET/ADDRESS', 214060, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1022, 1153, 'IN PROGRESS', 'Changing one-way on Close Avenue from a point 43 metres south of Queen Street West and King Street West', 'STREET/ADDRESS', 209210, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1041, 1175, 'IN PROGRESS', 'Changing one-way on Grant Street from a point 42.7 metres north of Queen Street East and Kintyre Avenue', 'STREET/ADDRESS', 209297, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1046, 1176, 'COMPLETED', 'JF-3354 Kingston Rd, June 11, 2010', 'STREET/ADDRESS', 209300, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1055, 1191, 'IN PROGRESS', 'Changing one-way on Lowther Avenue from a point 44 metres west of Avenue Road and Huron Street', 'STREET/ADDRESS', 209354, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1063, 1202, 'IN PROGRESS', 'Changing one-way on Palmerston Avenue from a point 68.0 metres south of College Street and the lane first north of Robinson Street', 'STREET/ADDRESS', 209418, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1064, 1203, 'CLOSED', 'em-renumber 59 Sutherland Dr to 47 Astor Av; June 29, 2010', 'STREET/ADDRESS', 214076, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1081, 1220, 'IN PROGRESS', 'Changing one-way on Temperance Street from a point 50 metres west of Yonge Street to Bay Street', 'STREET/ADDRESS', 209509, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1108, 1248, 'CLOSED', 'em-sever 54 Hammersmith Av; add 56, former entr for 54; July 13, 2010; B0097/05TEY', 'STREET/ADDRESS', 213345, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1125, 1265, 'CLOSED', 'mm-re-add Martin Goodman Trl/FldChkd-26Jul2010', 'STREET/ADDRESS', 214096, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1135, 1275, 'CLOSED', 'mm-add Ln E Islington N Market Garden, Ln W Canmotor N Queen Elizabeth/By Law No 606/2010', 'STREET/ADDRESS', 214102, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1156, 1299, 'INITIALIZED', 'JF-1313 Lake Shore Blvd E & 7 Leslie St, August 10, 2010', 'STREET/ADDRESS', 210147, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1157, 1298, 'CLOSED', 'JF-1144 Pharmacy Av, August 11, 2010', 'STREET/ADDRESS', 214119, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1158, 1297, 'CLOSED', 'JF-288 Boon Av, August 13, 2010', 'STREET/ADDRESS', 214118, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1183, 1324, 'CLOSED', 'mm-add 1292 Weston Rd/BellCan/PhotoMap2009/YLet-27Aug2010', 'STREET/ADDRESS', 214135, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1201, 1343, 'CLOSED', 'dm - change 28 Rees St name to John St  Pumping Station', 'STREET/ADDRESS', 214145, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1205, 1347, 'CLOSED', 'ld/edit Littles Rd to Little''s Rd south of Old Finch Ave-approved by Bill Moore/Brian Hall/req''d byGCC-Sepideh', 'STREET/ADDRESS', 214148, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1209, 1350, 'IN PROGRESS', 'ld/Connect proposed road Roper Rd to Mendelssohn St (temp until cadastral is finalized)as per EMS/JC & BHall & BSevigny', 'STREET/ADDRESS', 210543, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1238, 1384, 'CLOSED', 'em-add 29 Judson St, Sept 23, 2010', 'STREET/ADDRESS', 214170, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1239, 1385, 'CLOSED', 'em-add 7 Judson St, Sept 23, 2010, city-owned', 'STREET/ADDRESS', 214171, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1240, 1382, 'CLOSED', 'em-1 Faustina Dr (former Arena Dr)Sept 23, 10', 'STREET/ADDRESS', 214168, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1241, 1383, 'CLOSED', 'em-add 2 The Kingsway, Kingsway Gate Parkette; Sept 21, 2010', 'STREET/ADDRESS', 214169, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1252, 1396, 'CLOSED', 'mm-modify f.code Dekoven Mews, Leader Lane, Florist Lane/Cadastral', 'STREET/ADDRESS', 214180, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1282, 1427, 'CLOSED', 'em-amal 231, 233 College St, 177 Huron St, into 233; Oct 27, 2010', 'STREET/ADDRESS', 214206, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1299, 1446, 'CLOSED', 'em-add 407-415 Keele St; entr for 60 Heintzman St; Nov 9, 2010', 'STREET/ADDRESS', 214219, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1300, 1447, 'CLOSED', 'em-add 8 St Dunstan Dr; Nov 10, 2010', 'STREET/ADDRESS', 214220, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1325, 1472, 'CLOSED', 'ld/50H-Add missing entrance addresses on 571 Dundas St E/Grange Crt/Vanauley Walk-Mpac/Torpropmap', 'STREET/ADDRESS', 214244, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1445, 1592, 'IN PROGRESS', 'JF-LD-31-67 Saulter St, February 11, 2011. ON-HOLD until Site Task has been resolved by JF.(Feb22/parcels has been severed w/ corresponding arolls & addresses in Mpac & OAR. )', 'STREET/ADDRESS', 212525, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1499, 1650, 'HOLD', 'JF-DM-6490 Kingston Rd, March 9, 2011', 'STREET/ADDRESS', 213013, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1500, 1649, 'HOLD', 'JF-MM-2 Croydon Rd, March 8, 2011', 'STREET/ADDRESS', 213013, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1501, 1648, 'IN PROGRESS', 'JF-MM-31 Bisset Av, January 21, 2011', 'STREET/ADDRESS', 213013, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1517, 1666, 'COMPLETED', '49G-add 285 Dufferin St, ENT to 1182 King St W-LIM/police', 'STREET/ADDRESS', 213093, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1520, 1669, 'COMPLETED', 'JF-DM-26A Greendale Av, March 21, 2011', 'STREET/ADDRESS', 213116, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1526, 1675, 'IN PROGRESS', null, 'STREET/ADDRESS', 213193, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1527, 1676, 'IN PROGRESS', null, 'STREET/ADDRESS', 213196, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1528, 1677, 'IN PROGRESS', null, 'STREET/ADDRESS', 213203, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1529, 1678, 'INITIALIZED', null, 'STREET/ADDRESS', 213190, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1530, 1680, 'CLOSED', null, 'STREET/ADDRESS', 213343, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1531, 1679, 'HOLD', null, 'STREET/ADDRESS', 213185, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1539, 1688, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1540, 1693, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1541, 1690, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1542, 1689, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1543, 1692, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1544, 1691, 'COMPLETED', null, 'STREET/ADDRESS', 214330, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (30, 123, 'CLOSED', '1115 Lodestar Rd assigned; Dec 11, 2008', 'STREET/ADDRESS', 200125, 200247);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (54, 148, 'CLOSED', 'mm 49Q Modify 45,55 Cedarcroft Blvd, 285 Antibes Str to Prm/MPAC', 'STREET/ADDRESS', 213374, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (85, 181, 'HOLD', 'em-CofA 416 Kingston Rd, 73A Corley Av, Jan 7, 2009; letter Feb 3, 2009;', 'STREET/ADDRESS', 200437, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (87, 183, 'CLOSED', 'Delete Village Green Sq segments', 'STREET/ADDRESS', 200453, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (98, 197, 'CLOSED', 'dm- move 3A, 10,30,31 Gaudi St to northern segment to delete temp stub -66M-2463', 'STREET/ADDRESS', 213410, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (99, 196, 'HOLD', 'dm- delete temporary stub - Gaudi Rd to digitize permanent street - Scarlet Aug 08/08', 'STREET/ADDRESS', 200513, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (141, 244, 'CLOSED', 'mm Del 2801 Bloor St W/IGE2008/FldChkd 11Mar2009 and other IGE2008', 'STREET/ADDRESS', 213443, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (150, 253, 'CLOSED', 'ld/55Q-Edit & Split 75-89, 91-105, 107-127, 149-171, 173-195, 197-227, 229-251 Huntingdale Blvd(88pts) to indv nos(88 pts), edit 129 to 147, 253 to 283 to SE- FC Mar 23,2009/Mpac/SWbins', 'STREET/ADDRESS', 213450, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (159, 271, 'HOLD', 'ld- Merge 119 137 & 147 Merton St to 119(LSSE) and add 139 as SSE- Torlet 14May1999', 'STREET/ADDRESS', 201512, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (185, 298, 'CLOSED', 'em-IGE memo, 5 Merrill Av; March 24, 2009', 'STREET/ADDRESS', 213472, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (195, 308, 'CLOSED', 'mm-modify f.code,jurisd.Ruttan St/By-Law 627/2007', 'STREET/ADDRESS', 213476, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (212, 325, 'CLOSED', 'em-assign 2731 Markham Rd; letter April 14, 2009', 'STREET/ADDRESS', 213490, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (242, 356, 'CLOSED', 'Removing one-way coding from segments on Jeanette St that were coded accidentally. Removed one-way coding from segments on Belt Line Trail and Rosedale Valley Trail.', 'STREET/ADDRESS', 213510, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (260, 375, 'CLOSED', 'ld/edit 271A/B Russell Hill Rd to SE', 'STREET/ADDRESS', 213524, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (264, 379, 'HOLD', 'em-CofA 92, 94, 96 Cameron Av; May 11, 2009', 'STREET/ADDRESS', 202834, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (295, 414, 'CLOSED', 'mm 59L Portia St extend/Cadastral/FldChkd 1Jun2009', 'STREET/ADDRESS', 213551, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (318, 438, 'CLOSED', 'em-add 560 Bayview Av, entr for 550; June 18, 2009', 'STREET/ADDRESS', 213569, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (320, 440, 'HOLD', 'JF-MM-Add 112 Simpson Av, June 18, 2009', 'STREET/ADDRESS', 203434, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (332, 452, 'CLOSED', 'ld-add 408 to 414 Wilson Ave-Bins-Ktulk/Mpac/yelw', 'STREET/ADDRESS', 213579, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (352, 472, 'CLOSED', 'mm add 20 to 38 Tandridge Cres(STR to 20-38)', 'STREET/ADDRESS', 213589, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (356, 477, 'CLOSED', 'em-add 8-32 Abell St; entr for 38 Abell St; Aug 20, 2009', 'STREET/ADDRESS', 213591, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (368, 489, 'CLOSED', 'Del prv prop Aroll 19041126300 3000 0000, part of Rosemary Rd N of Burton Rd-PIN211780046 as per KFerguson email/FC 25Aug2009/Apset', 'STREET/ADDRESS', 213600, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (443, 566, 'CLOSED', 'mm-Modify f.code Aquatic Dr to trail/FldChkd-02Jun2009', 'STREET/ADDRESS', 213663, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (463, 586, 'CLOSED', 'em-add 191 Dowling Av; entr for 189 Dowling Av; Sept 24, 09', 'STREET/ADDRESS', 213681, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (473, 596, 'CLOSED', 'em-add 50 Drummond Pl; entr for 328 Adelaide St W; Sept 30, 09', 'STREET/ADDRESS', 213688, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (474, 598, 'HOLD', 'em-cofa-add 532, 534, 536 Glencairn Av; Sept 30, 09', 'STREET/ADDRESS', 204818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (475, 597, 'HOLD', 'em-cofa-add 345A, 345B Hollywood Av; Sept 30, 09', 'STREET/ADDRESS', 204818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (476, 599, 'HOLD', 'em-add 115 Black Creek Dr; Sept 30, 09', 'STREET/ADDRESS', 204818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (620, 746, 'HOLD', 'em-cofa for 390 Jones Av; add 388; Nov 24, 09', 'STREET/ADDRESS', 206013, -1);
--commit;
--PROMPT 1200 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (621, 745, 'HOLD', 'em-renum 164 Avenue Rd to 170; res condo; add 160, 168 Avenue Rd (retail), 127, 129, 131, 133 and 135 Pears Av (townhouse); Nov 24, 2009', 'STREET/ADDRESS', 206013, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (624, 749, 'CLOSED', 'ld/extend public road, fcoded as walkway-, French Ave, west of Kitchener-Plan66R21950/64R15377', 'STREET/ADDRESS', 213799, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (633, 759, 'CLOSED', 'ld-49G-move onto sales offc bldg- 1100 King St W-em/imagery', 'STREET/ADDRESS', 213802, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (672, 798, 'CLOSED', 'ld/renumber 303X Lawrence Ave E to 303-MunLetr fr JF will follow/Mpac/SW', 'STREET/ADDRESS', 213834, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (682, 808, 'HOLD', 'em-c of a ; 107, 111 Spruce Hill Rd, conveyance; Jan 27, 2010', 'STREET/ADDRESS', 206602, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (689, 815, 'CLOSED', 'dm - adding 26, 50 Village Green Sq - deleting 2065 Kennedy Rd - Torlet Feb 26/09 / Map 56N-22', 'STREET/ADDRESS', 213848, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (813, 941, 'CLOSED', 'ld/48J22-renumber 225 Franklin Ave to 38 Hugo Ave & fix laneway''s segments-Torlet 10Aug2009 for JF', 'STREET/ADDRESS', 213937, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (819, 945, 'CLOSED', 'JF-MM-230 Upper Highland Cr, November 16, 2009', 'STREET/ADDRESS', 213941, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (820, 946, 'HOLD', 'JF-MM 359 Kane Av, January 28, 2010', 'STREET/ADDRESS', 207763, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (921, 1051, 'CLOSED', 'ld/ to move 339 Queens Quay W onto bldg-Fire 334 & EMS 36-imagery/ CMachnacky/ FC27Jun2007', 'STREET/ADDRESS', 214003, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (922, 1052, 'CLOSED', 'mm-del Cathron St-untravelled-S of The Queensway ,W of Park Lawn Rd/MasterStreetNameList/PhotoMap2009', 'STREET/ADDRESS', 214004, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (940, 1074, 'COMPLETED', 'JF-234 Aldercrest Rd, May 10, 2010', 'STREET/ADDRESS', 208562, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (941, 1073, 'CLOSED', 'JF-1500 Weston Rd, February 12, 2010', 'STREET/ADDRESS', 214015, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (942, 1072, 'CLOSED', 'JF-48 Scunthorpe Rd, February 8, 2010', 'STREET/ADDRESS', 214014, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (943, 1075, 'CLOSED', 'JF-86 Parliament St, April 22, 2010', 'STREET/ADDRESS', 214016, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (946, 1078, 'HOLD', 'em-add 5162, 5168 Yonge St; res condo, 4, 20, 30 Park Home Av, (parks); May 6, 2010', 'STREET/ADDRESS', 208586, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (951, 1084, 'CLOSED', 'JF-275 Unwin Av, May 13, 2010', 'STREET/ADDRESS', 214022, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (952, 1085, 'HOLD', 'JF-1214 Royal York Rd, May 14, 2010', 'STREET/ADDRESS', 208685, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (953, 1083, 'HOLD', 'JF-141 Pitt Av, May 18, 2010', 'STREET/ADDRESS', 208685, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (998, 1130, 'CLOSED', 'dm - add Colborne Lodge extension - aerial photo - Jun 11/10', 'STREET/ADDRESS', 214050, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1003, 1135, 'CLOSED', 'JF-330 Willowdale Av, March 9, 2010', 'STREET/ADDRESS', 214054, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1004, 1137, 'HOLD', 'JF-952 Avenue Rd, May 18, 2010', 'STREET/ADDRESS', 209093, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1005, 1136, 'CLOSED', 'JF-1106 Queen St W, May 27, 2010', 'STREET/ADDRESS', 214055, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1007, 1140, 'IN PROGRESS', 'Changing one-way on Albany Ave to a point 94.2 metres north of Bridgman Avenue and Davenport Road ', 'STREET/ADDRESS', 209126, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1008, 1139, 'IN PROGRESS', 'Changing one-way on CONNAUGHT AVE to a point 97.5 metres south of Queen Street East and Eastern Avenue', 'STREET/ADDRESS', 209126, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1016, 1148, 'IN PROGRESS', 'Changing one-way on Blackthorn Avenue from a point 117 metres north of St. Clair Avenue West and Rowntree Avenue', 'STREET/ADDRESS', 209174, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1089, 1229, 'CLOSED', 'em-renumber 11-23 Nancy Pocock Place, numbers in reverse; Sept 3, 2010', 'STREET/ADDRESS', 214086, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1093, 1234, 'CLOSED', 'dm - extend Select Ave -SC ltr Jan 14/10 -66M-2480', 'STREET/ADDRESS', 214090, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1126, 1266, 'HOLD', 'JF-169 - 177 Finch Av E, July 28, 2010', 'STREET/ADDRESS', 209964, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1127, 1267, 'CLOSED', 'JF-14 Chipstead Rd, July 28, 2010', 'STREET/ADDRESS', 214097, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1131, 1271, 'CLOSED', '48J12-modify 149A fr SSE to LSSE-Mpac/Tor prop datamap/Facility-AMalik', 'STREET/ADDRESS', 214099, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1189, 1330, 'CLOSED', 'ld-edit to attach 3479 Yonge St to correct segment(NY)-cadastral/Aroll', 'STREET/ADDRESS', 214138, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1198, 1340, 'CLOSED', 'JF-LD-1568 Queen St W, September 3, 2010', 'STREET/ADDRESS', 214142, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1199, 1341, 'CLOSED', 'JF-DM-3083 Dufferin St, September 2, 2010', 'STREET/ADDRESS', 214143, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1203, 1345, 'CLOSED', 'ld/edit name to Humber Arts & Media Studio(Humber Lakeshore Campus) -300 Birmingham St- Humber CA onlne/em', 'STREET/ADDRESS', 214147, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1215, 1358, 'CLOSED', 'ld-moved 60 & 70 Worcester Rd into parcel', 'STREET/ADDRESS', 214154, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (3, 3, 'IN PROGRESS', 'Revert Admin Area transaction', 'REVERT_ADMINAREA', 1, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1243, 1387, 'HOLD', 'JF-397 Glen Park Av, September 14, 2009', 'STREET/ADDRESS', 210768, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1279, 1423, 'CLOSED', 'em-reassigned, new commerc bldg; 3132 Eglinton Av E; Oct 19, 2010', 'STREET/ADDRESS', 214203, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1280, 1424, 'CLOSED', 'em-to assmt-4301-4331 Kingston Rd; Oct 19, 2010', 'STREET/ADDRESS', 214204, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1281, 1426, 'CLOSED', 'ld/49L12-Tony Grande Lane addr to move-Torlet 22Jan2008/cadastral', 'STREET/ADDRESS', 214205, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1296, 1442, 'CLOSED', 'mm-Freshmeadow Dr, Hollyberry Trl, Cliffwood Rd, Applegate Cres - fix addr loc/Cadastral', 'STREET/ADDRESS', 214216, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1301, 1448, 'CLOSED', 'dm - move 3555 McNicoll Ave to correct parcel - MPAC document - Nov 09/10', 'STREET/ADDRESS', 214221, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1310, 1457, 'CLOSED', 'mm-Mentor Blvd, Picola Crt fix addr loc/Cadastral', 'STREET/ADDRESS', 214229, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1311, 1458, 'CLOSED', 'JF-MM-DM-3895 McNicoll Av, November 18, 2010', 'STREET/ADDRESS', 214230, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1314, 1461, 'CLOSED', 'mm-Bedle Ave fix addr loc/Cadastral', 'STREET/ADDRESS', 214233, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1350, 1497, 'CLOSED', 'mm-modify name 427 C S Rathburn Ramps to 427 C S Burnhamthorpe Ramps (5 arcs)/Police KO-30Dec2010/Cadastral', 'STREET/ADDRESS', 214263, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1382, 1529, 'IN PROGRESS', 'Adding Leaside CN Rail Spur Trail north of Eglinton Ave East to Bond Park', 'STREET/ADDRESS', 211920, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1422, 1569, 'CLOSED', 'ld/edit prm to entr - 387 Spadina Ave-Tor propmap 50h12', 'STREET/ADDRESS', 214309, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1425, 1572, 'CLOSED', 'em-IGE temp -181 Torbarrie Rd; Feb 8, 2011', 'STREET/ADDRESS', 214310, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1455, 1602, 'CLOSED', 'ld/51K-Delete Ln N Heath W Alvin-BL776-2010/Memo 20Sep2010', 'STREET/ADDRESS', 214332, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1484, 1632, 'CLOSED', 'mm-St Lucie Dr, Franson Cres fix addr loc/Cadastral', 'STREET/ADDRESS', 214352, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1516, 1665, 'COMPLETED', 'dm - movinf addrs on Zaph Ave, Pythagoras Dr, Archemedes Crt - Feb 17/09', 'STREET/ADDRESS', 213046, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1518, 1667, 'COMPLETED', 'dm -moving addrs - 3 to 50 Curran Hall Cres to correct parcels - SC ltr Jan 14/08', 'STREET/ADDRESS', 213103, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1532, 1681, 'HOLD', null, 'STREET/ADDRESS', 213268, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1533, 1682, 'IN PROGRESS', null, 'STREET/ADDRESS', 213271, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1535, 1684, 'INITIALIZED', null, 'STREET/ADDRESS', 213312, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1536, 1685, 'INITIALIZED', null, 'STREET/ADDRESS', 213313, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1538, 1687, 'CLOSED', null, 'STREET/ADDRESS', 213341, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (24, 116, 'CLOSED', 'Add 27 Tapscott Rd as ENTR to 31-51. Move new pt 27 Tapscott Rd to fix range addr sys error.', 'STREET/ADDRESS', 213357, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (73, 168, 'CLOSED', 'JF-Add 455 Winona Dr to existing parcel', 'STREET/ADDRESS', 213390, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (74, 169, 'CLOSED', 'JF- Change 44 Mallingham Court to 46A', 'STREET/ADDRESS', 213391, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (83, 179, 'CLOSED', 'mm 48P Del temstub De Boers Dr', 'STREET/ADDRESS', 213399, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (84, 180, 'CLOSED', 'mm 56Q Modify segm Alexmuir Blvd to 201 Alexmuir Blvd', 'STREET/ADDRESS', 200907, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (97, 195, 'CLOSED', 'em-renumber 213 to 233 Westview Blvd, add entr 12 Galbraith Av;', 'STREET/ADDRESS', 213409, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (144, 247, 'CLOSED', 'dm - fixing addr ranges - Wilcox Creek Ptwy - scarlet feb17/09', 'STREET/ADDRESS', 213446, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (162, 274, 'CLOSED', 'JF Add Nos. 21-23 Goodwill Av & 121 Wilson Hts Blvd ', 'STREET/ADDRESS', 213457, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (199, 312, 'CLOSED', null, 'STREET/ADDRESS', 213480, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (222, 335, 'CLOSED', 'mm Add 3A Cliff St/Cadastral/MPAC', 'STREET/ADDRESS', 213497, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (253, 367, 'CLOSED', 'Del 38X Kennedy Park Rd;add Kennedy Margdon Parkette to #24-FC 5May2009', 'STREET/ADDRESS', 213519, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (254, 368, 'CLOSED', 'dm - moving 11 Lee Centre Dr to correct range - APSET/ field check Jun 13/03', 'STREET/ADDRESS', 213520, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (258, 373, 'HOLD', 'em-add 80, 100 Yorkville Av - res condo, 82, 98 Yorkville Av - commerc condo, 76 Yorkville Av - TPA parking, 78, 92 Yorkville Av-retail entr; May 6, 2009', 'STREET/ADDRESS', 202701, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (262, 377, 'CLOSED', 'dm- adding extension - Brian Peck Cres - Scar ltr Apr 23/08', 'STREET/ADDRESS', 213526, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (270, 386, 'HOLD', 'em-cofa-convey-32-34 Sherbourne St North; May 13, 2009', 'STREET/ADDRESS', 202882, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (286, 405, 'CLOSED', 'em-renumber 2 Ridge Drive Park to 2 Ridge Dr; May 27, 2009', 'STREET/ADDRESS', 213544, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (288, 407, 'CLOSED', 'dm - edit 3026-3032 Danforth Ave / 3026 becomes prime - May 28/09', 'STREET/ADDRESS', 213546, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (300, 419, 'CLOSED', 'em- amal 1439 Danforth Av and 220 Parkmount Rd; June 4, 2009', 'STREET/ADDRESS', 213553, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (311, 431, 'CLOSED', 'ld/50H23-renaming to St Basil Lane', 'STREET/ADDRESS', 213563, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (313, 433, 'CLOSED', 'Ld/Renaming to St Vincent Lane-BH/Apset50H232001', 'STREET/ADDRESS', 213565, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (325, 445, 'CLOSED', 'ld/Added 390 392 394 396 398 Wilson Ave-bins/Mpac', 'STREET/ADDRESS', 213574, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (340, 460, 'CLOSED', 'dm - delete unused C N R spur line connecting Pilkington Dr - Aug 18/09', 'STREET/ADDRESS', 213583, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (409, 532, 'HOLD', 'JF-LD-Add 83-91B Walnut Av, May 7, 2009', 'STREET/ADDRESS', 204377, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (483, 606, 'CLOSED', 'Edit 133X to 133 the Kingsway (severed from 131)', 'STREET/ADDRESS', 213693, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (520, 642, 'CLOSED', 'JF-MM Add 59 Giltspur Dr, October 23, 2009', 'STREET/ADDRESS', 213723, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (521, 645, 'HOLD', 'JF-DM- Add 4A,4B Holborne Av, March 27, 2009', 'STREET/ADDRESS', 205244, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (525, 649, 'CLOSED', 'dm- adding 65 & 75 ENTR to 65-75 Halsey Ave - CanPost / MPAC - Oct 27/09', 'STREET/ADDRESS', 213727, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (549, 673, 'CLOSED', 'Add 113 to 127 Frederick St Entr to 171 Front St E-bins/FC/LIM', 'STREET/ADDRESS', 213737, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (589, 714, 'CLOSED', 'ld-rename 2 segments to West Hill Dr-reg plan 2253-PIN 13781965/apset', 'STREET/ADDRESS', 213778, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (614, 739, 'CLOSED', 'ld/add 4130A Lawrence Ave E-FC 15Dec2009/ML will be added by EM later.', 'STREET/ADDRESS', 213796, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (651, 777, 'IN PROGRESS', 'Adding trails from RUSSELL HILL RD to BELTLINE TRL and LARRATT ST to BELTLINE TRL.', 'STREET/ADDRESS', 206241, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (653, 779, 'CLOSED', 'dm- adding 196 to 274 Leyton Ave for bin program / MPAC Jan 20/10', 'STREET/ADDRESS', 213818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (661, 787, 'CLOSED', 'ld/move 1996 St Clair Ave W into TTC-Maybank Trolley Loop-JF', 'STREET/ADDRESS', 213825, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (665, 791, 'CLOSED', 'em-renumber 10A and 10B Winslow St to 10 and 10A; Jan 22, 2010', 'STREET/ADDRESS', 213828, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (673, 799, 'CLOSED', 'mm-Modified 39 laneways to named Lanes in Cabbagetown-Phase2/By-Law 823-2009', 'STREET/ADDRESS', 213835, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (675, 801, 'IN PROGRESS', 'Editing Hunter''''S Glen Junior Public School to test apostrophe. Changing Linear Feature Name for 3 and 49 Stableford Cres to 3 and 49 Curran Hall Cres.', 'STREET/ADDRESS', 206518, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (676, 802, 'CLOSED', 'dm - adding private lane - Pherrill Mews ; and addresses 1 to 17 Pherrill Mews plus 3771A to 3777B  St Clair Ave E Torlet Jan 27/09 - map 57K', 'STREET/ADDRESS', 213836, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (706, 832, 'CLOSED', 'dm - editing Silver Star Blvd - aerial imagery/ parcel mapping', 'STREET/ADDRESS', 213857, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (729, 855, 'CLOSED', 'mm-Modify jurisd to City of Toronto 9 streets between Cook Rd, Leitch Ave and Murray Ross Blvd', 'STREET/ADDRESS', 213872, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (754, 881, 'CLOSED', 'mm-fix  C/L loc of Harshaw Ave at Methuen Ave/PropDataMap', 'STREET/ADDRESS', 213890, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (774, 903, 'CLOSED', 'Adding Access to Taylor Creek Trail via Lumsden Ave', 'STREET/ADDRESS', 213908, -1);
--commit;
--PROMPT 1300 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (787, 915, 'HOLD', 'em-renumber 95 Iannuzzi St to 169 Fort York Blvd, res condo, add 24 Bathust St, 165, 173, 177 Fort York Blvd as entr for retial units; March 12, 2010', 'STREET/ADDRESS', 207536, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (850, 979, 'HOLD', 'em-amal 181, 199, 203 Richmond St W, 10, 32 Nelson St, res condo, commerc, office and townhomes; April 12, 2010', 'STREET/ADDRESS', 207980, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (851, 978, 'CLOSED', 'em-renum 380 to 378 St Germain Av; April 12, 2010', 'STREET/ADDRESS', 213965, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (859, 988, 'HOLD', 'JF-272-278 Horsham Av, March 5, 2009', 'STREET/ADDRESS', 208034, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (860, 989, 'CLOSED', 'JF-1 Clouston Av, October 2, 2009', 'STREET/ADDRESS', 213969, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (861, 987, 'HOLD', 'JF-34 Kirkland Blvd, May 29, 2009', 'STREET/ADDRESS', 208034, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (875, 1006, 'HOLD', 'JF-150 Rimrock Rd and 1115 Lodestar Rd, December 24, 2009', 'STREET/ADDRESS', 208131, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (894, 1024, 'CLOSED', 'mm-modify Ln 2 S Harbord E Major to Louie Laki LaneBy-Law 291-2010', 'STREET/ADDRESS', 213989, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (906, 1036, 'CLOSED', 'ld/added 300 New Toronto St req by IT-AMalik, as per EM./Mpac', 'STREET/ADDRESS', 213994, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (934, 1066, 'CLOSED', 'ld/ 58K-to add 121 Livingston Rd-Guildwood Farmer''s Market - entrance to 85 Livingston Rd-mun.letr fr em will be attached later.', 'STREET/ADDRESS', 214008, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (944, 1076, 'CLOSED', 'ld/adding 351 Melrose Ave,ENT to 1781 Avenue Rd-Inq.Tor Pol/Mpac/FC 12May2010/MunLetr will follow fr EM', 'STREET/ADDRESS', 214017, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (945, 1077, 'IN PROGRESS', 'Removing one-way on George St between Adelaide Street East and Richmond Street East', 'STREET/ADDRESS', 208576, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (947, 1079, 'CLOSED', 'mm-add Ln S Lawrence E Homestead/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214018, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (959, 1091, 'CLOSED', null, 'STREET/ADDRESS', 214025, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (976, 1108, 'CLOSED', 'JF-58R Garnet Av, April 27, 2010', 'STREET/ADDRESS', 214040, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (977, 1109, 'CLOSED', 'JF-7 Richgrove Dr, May 28, 2010', 'STREET/ADDRESS', 208853, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (978, 1110, 'CLOSED', 'JF-2787-2791 Victoria Park Av, Leafield Dr extension, April 20, 2010', 'STREET/ADDRESS', 209138, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (979, 1111, 'HOLD', 'em-cofa convey, 108, 110 Poplar Plains Rd; June 1, 2010', 'STREET/ADDRESS', 208871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (980, 1114, 'CLOSED', 'em-assign 50 Humber Bay Park Rd West, Humber Bay Promenade Park; June 1, 2010', 'STREET/ADDRESS', 214041, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (981, 1112, 'HOLD', 'em-cofa add 80, 82 Birch Av; June 1, 2010', 'STREET/ADDRESS', 208871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (982, 1113, 'HOLD', 'em-cofa, add 67, 69 Euclid Av; June 1, 2010', 'STREET/ADDRESS', 208871, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1009, 1141, 'CLOSED', 'Changing one-way on Orchard Park Boulevard Queen Street East and a point 71.6 metres west of Kingston Road', 'STREET/ADDRESS', 214056, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1010, 1142, 'IN PROGRESS', 'Changing one-way on Baldwin St from Augusta Avenue and a point 98.4 metres west of Spadina Avenue', 'STREET/ADDRESS', 209143, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1012, 1143, 'IN PROGRESS', 'Changing Bartlett Avenue North A point 46 metres north of Geary Avenue and a point 122 metres north of Geary Avenue', 'STREET/ADDRESS', 209147, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1549, 1698, 'IN PROGRESS', null, 'STREET/ADDRESS', 214543, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1014, 1146, 'CLOSED', 'Changing Beatrice Street from Dundas Street West and a point 59 metres south of College Street', 'STREET/ADDRESS', 214058, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1024, 1156, 'IN PROGRESS', 'Changing one-way on Dalhousie Street from a point 54 metres north of Dundas Street East and Gould Street', 'STREET/ADDRESS', 209224, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1051, 1186, 'IN PROGRESS', 'Capturing one-ways in traffic schedules where the by-law number is not known', 'STREET/ADDRESS', 209334, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1075, 1214, 'CLOSED', 'em-add 2636 Eglinton Av E, prime, add entr 2340-2692, incl 2682A; June 23, 28, 2010July 5, 2010', 'STREET/ADDRESS', 214080, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1090, 1230, 'CLOSED', 'mm-add Entrance Rd, Woodbine Track Access(access from Rexdale Blvd)/APSET/PhotoMap2009', 'STREET/ADDRESS', 214087, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1094, 1233, 'CLOSED', '48J12- to add new lane Elsie Lane-BL 570-2010/reg plan M226/Plan 66R-246405/Str Naming Jul2010', 'STREET/ADDRESS', 214089, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1098, 1238, 'HOLD', 'em-cofa, convey, 156/158 Davenport Rd; July 8, 2010', 'STREET/ADDRESS', 209662, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1119, 1260, 'CLOSED', 'JF-190 Silver Star Blvd, July 21, 2010', 'STREET/ADDRESS', 213352, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1120, 1261, 'HOLD', 'JF-100 Garrison Rd - Fort York Blvd, July 20, 2010', 'STREET/ADDRESS', 209889, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1121, 1259, 'CLOSED', 'JF-11 Claremont St, July 21, 2010', 'STREET/ADDRESS', 213351, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1124, 1264, 'CLOSED', 'dm - modify 13 Rivitt Pl to 13B - SC ltr Jul 22/10', 'STREET/ADDRESS', 214095, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1141, 1282, 'CLOSED', 'Ld-50G-edit name Skydome to Rogers Centre- 1 Blue Jays Way-Rogers Centre site', 'STREET/ADDRESS', 214106, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1142, 1289, 'CLOSED', 'em-add 150 Peter St, entr for 375 Queen St W; Aug 24, 2009 ', 'STREET/ADDRESS', 214112, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1143, 1284, 'CLOSED', 'em-assign 20 Sherry Rd; Aug 6, 2010', 'STREET/ADDRESS', 214107, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1144, 1290, 'CLOSED', 'em-assign 3 Leyton Av; prop house; Aug 20, 2009', 'STREET/ADDRESS', 214113, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1145, 1292, 'HOLD', 'em-add 155, 165 Legion Rd N, 251 Manitoba St; res condo; March 2, 2009', 'STREET/ADDRESS', 210063, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1146, 1285, 'CLOSED', 'em-add emergency exits for prop Spadina Subway extens; 2 Whitehorse Rd, 18 St Regis Cres, 2 Toro Rd, 45 The Pond Rd; Aug 5, 2010', 'STREET/ADDRESS', 214108, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1147, 1288, 'CLOSED', 'em-assign 136 Westmore Dr; Aug 24, 2009', 'STREET/ADDRESS', 214111, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1148, 1287, 'CLOSED', 'em-add 185 Northwest Gate, prop sub st (extension for Spadina to York Univ); entr for 4700 Keele St; July 29, 2010', 'STREET/ADDRESS', 214110, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1149, 1291, 'CLOSED', 'em-renum 23 Brinloor Blvd to 4 Duncombe Blvd; Aug 11, 2009', 'STREET/ADDRESS', 214114, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1150, 1286, 'CLOSED', 'em-add 4300 Keele St; Aug 5, 2010', 'STREET/ADDRESS', 214109, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1151, 1283, 'HOLD', 'em-cofa for 1 Pape Av, add 596 Eastern Av; Aug 6, 2010', 'STREET/ADDRESS', 210063, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1153, 1294, 'HOLD', 'em-cofa for 430 Nairn Av; add 432; Aug 10, 2010', 'STREET/ADDRESS', 210117, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1190, 1331, 'CLOSED', 'ld-delete 2 Trinity St-Not found in Mpac/FC Mar2007&Aug2010/LIM', 'STREET/ADDRESS', 214139, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1195, 1337, 'HOLD', 'JF-DM-92 Wesley St, August 13, 2010', 'STREET/ADDRESS', 210459, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1196, 1338, 'HOLD', 'JF-DM-98 Heale Av, August 13, 2010', 'STREET/ADDRESS', 210459, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1216, 1360, 'IN PROGRESS', 'em-cofa for 150 Sudbury St, add 170 Sudbury St and 38 Abell St; Aug 31, 2010', 'STREET/ADDRESS', 210585, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1217, 1361, 'CLOSED', 'em-Crothers Woods Trial: 7, 21, 27 Redway Rd, 1115 Bayview Av, 200 Pottery Rd, 66, 76 Beechwood Dr; Sept 8, 2010', 'STREET/ADDRESS', 214155, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1218, 1359, 'HOLD', 'em-renumber 438 Church St to 60 Carlton St, Maple Leaf Bldg, now Loblaw; add 50 Carlton St, entr; Sept 1, 2010', 'STREET/ADDRESS', 210585, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1222, 1366, 'CLOSED', 'ld/DM- 48Q11-To add private road - Apollo Place - BL 993-2010 passed 27Aug2010', 'STREET/ADDRESS', 214157, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1225, 1370, 'CLOSED', 'JF-LD-62 Greenwood Av, August 26, 2010', 'STREET/ADDRESS', 214160, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1226, 1369, 'HOLD', 'JF-DM-10 Winfield Av, September 1, 2010', 'STREET/ADDRESS', 210649, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1227, 1371, 'CLOSED', 'JF-LD-351 Wallace Av, August 23, 2010', 'STREET/ADDRESS', 214161, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1242, 1386, 'CLOSED', 'ld-editing names for 4000 Leslie St, 555 Finch Ave W', 'STREET/ADDRESS', 214172, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1263, 1407, 'CLOSED', 'em-add 18 Lennox St, entr for 16; Oct 12, 2010', 'STREET/ADDRESS', 214188, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1270, 1414, 'CLOSED', 'ld/moved 43 to 53 St Paul St, 443A to 447C & 449 Queen St E', 'STREET/ADDRESS', 214195, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1278, 1422, 'CLOSED', 'mm-Regatta Cres,Elise Ter addr fix loc/Cadastral', 'STREET/ADDRESS', 214202, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1292, 1438, 'CLOSED', 'em-add 31 Melrose Av, entr for 33; Nov 2, 2010', 'STREET/ADDRESS', 214213, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1327, 1474, 'CLOSED', 'dm - delete 404-406 Livingston Rd - e-mail ltr 12/06/2010', 'STREET/ADDRESS', 214246, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1351, 1498, 'CLOSED', 'em-3115 Markham Rd, indstr-prime, add entr: 3135, 3155, 3165, 3175 Markham Rd, 215, 225 Select Av, 620 Passmore Av; Dec 31, 2010', 'STREET/ADDRESS', 214264, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1354, 1501, 'CLOSED', 'mm-Realignment Dufferin St between Queen St W and Peel Ave/Cadastral/officially open Nov 18/2010', 'STREET/ADDRESS', 214267, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1405, 1552, 'CLOSED', null, 'STREET/ADDRESS', 214297, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1433, 1580, 'CLOSED', 'Fixed intersections and centerlines', 'STREET/ADDRESS', 214316, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1436, 1583, 'CLOSED', 'dm - adding addrs for new private lane -- 6 to 79 Jeremiah Lane - SC ltr May 15/08', 'STREET/ADDRESS', 214317, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1444, 1591, 'CLOSED', 'em-add 5-35 Blaffers Park Rd; for yacht clubs; Feb 7, 2011', 'STREET/ADDRESS', 214324, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1467, 1614, 'CLOSED', 'JF-DM-5A Pine Ridge Dr, February 23, 2011', 'STREET/ADDRESS', 214340, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1468, 1616, 'IN PROGRESS', 'JF-LD-6A Brockton Av, February 28, 2011', 'STREET/ADDRESS', 212767, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1469, 1615, 'CLOSED', 'JF-DM-19 Hillcroft Dr, February 28, 2011', 'STREET/ADDRESS', 214341, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1472, 1617, 'CLOSED', '49H-move 59R Hepbourne St-mpac/IT-meena', 'STREET/ADDRESS', 214342, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1487, 1635, 'CLOSED', 'dm - moving addrs -330 to 340 Danforth Rd -e-mail ltr Mar 14/011- ', 'STREET/ADDRESS', 214354, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1521, 1670, 'COMPLETED', 'dm - moving addrs to correct parcels - 8 to 58 Jeremiah Lane - SC ltr Nov 25/10', 'STREET/ADDRESS', 213125, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (61, 155, 'HOLD', 'em-68Brenda Cr, CofA (B028/08SC), sever; Jan 20, 2009;', 'STREET/ADDRESS', 200307, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (86, 182, 'CLOSED', 'mm 42F Add Ln W Browns N Albright/ByLaw11953', 'STREET/ADDRESS', 213400, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (108, 209, 'HOLD', 'em-add 18, 20 Maxome Av; 232 Pemberton Av; Feb 18, 2009;', 'STREET/ADDRESS', 200604, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (133, 235, 'CLOSED', 'mm 50J Move 111 Bernard Ave/Inhouse maint.', 'STREET/ADDRESS', 213435, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (138, 241, 'CLOSED', 'em-add 2190E Bloor St W as entr for 2192 Bloor St W; Tor lett March 9, 2009; ', 'STREET/ADDRESS', 213440, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (139, 242, 'CLOSED', 'em-revision for 1 and 25 Cole St; pt of 620 Dundas St E; Regent park; Tor lett March 10, 2009;', 'STREET/ADDRESS', 213441, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (143, 246, 'CLOSED', 'ld/47J12-Move loc 2184 to 2192 Bloor St W(14-overlap''g pts as per torlet 9Mar 2009 /imagery)', 'STREET/ADDRESS', 213445, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (146, 249, 'CLOSED', null, 'STREET/ADDRESS', 201196, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (172, 285, 'HOLD', 'JF - Add Nos. 4438 - 4452 Bathurst St', 'STREET/ADDRESS', 201654, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (206, 319, 'COMPLETED', 'Changed one-way to two-way on Dalhousie St at Dundas St E. ', 'STREET/ADDRESS', 202126, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (218, 331, 'HOLD', 'JF- LD-Change 251A and 251B Howland Avenue', 'STREET/ADDRESS', 202320, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (220, 333, 'COMPLETED', 'Added one-ways to Colborne Lodge Rd and West Rd.', 'STREET/ADDRESS', 202343, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (257, 372, 'HOLD', 'JF-MM-Add 1 Canterbury Place (February 11, 2009)', 'STREET/ADDRESS', 202720, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (290, 409, 'CLOSED', 'mm 52N 731 Sheppard Ave E (Subway stn fix loc)/MPAC/Cadastral', 'STREET/ADDRESS', 213548, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (307, 426, 'HOLD', 'em-cofa 1001-1009-1019 Sheppard Av East (B0090/08NY); June 10, 2009', 'STREET/ADDRESS', 203300, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (324, 444, 'CLOSED', 'Ld/57J-Moved loc 7 Brimley Rd S as per IanLaw /FC 01May2006', 'STREET/ADDRESS', 213573, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (326, 446, 'CLOSED', 'ld/add 400 to 406 Wilson Ave-BinskTulk/mpac/yelw', 'STREET/ADDRESS', 213575, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (327, 447, 'CLOSED', 'em-add 1255 Military Trail (child care centre)UofT Scarb, Aug 6, 2009, entr for 1265 Military Trail;', 'STREET/ADDRESS', 213576, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (329, 449, 'CLOSED', 'mm-del 361 Lawrence Ave E/NYLet 4Aug2009', 'STREET/ADDRESS', 213578, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (355, 476, 'HOLD', 'JF-LD-Add 104 St Clements & 99 Briar Hill, April 21, 2009.', 'STREET/ADDRESS', 203877, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (385, 508, 'CLOSED', 'Ld-Extend Deer Pen Rd 200m west of Spring Rd to Colborne Lodge Dr-Transportation/vesna-25May09/FC 24Aug2009/imagery', 'STREET/ADDRESS', 213613, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (386, 510, 'CLOSED', 'em- add 29-55 Bishop Tutu Blvd; Sept 3, 09 (LIM, prop data maps)', 'STREET/ADDRESS', 213615, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (387, 509, 'CLOSED', 'em-add 16, 18 Culver La; letter Dec 20, 2004;Sep 3, 09', 'STREET/ADDRESS', 213614, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (389, 511, 'CLOSED', 'Del Ln S Eglinton E Northcliffe/By-Law 125-2001,Plan 64R-16885', 'STREET/ADDRESS', 213616, -1);
--commit;
--PROMPT 1400 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (400, 523, 'CLOSED', 'mm-Add Toronto-Ward''s Island Ferry Route', 'STREET/ADDRESS', 213627, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (406, 529, 'CLOSED', 'JF-LD Add 1071 Queen St W, September 4, 2009', 'STREET/ADDRESS', 213631, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (407, 530, 'CLOSED', 'em-add 1173-1195 Brimley Rd; entr for 1171 Brimley Rd; Sept 8, 2009', 'STREET/ADDRESS', 213632, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (449, 572, 'CLOSED', 'dm - adding 101 to 127 , 200 to 230 Danzig St for the barbage bin program -  Sep 22/09', 'STREET/ADDRESS', 213667, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (459, 582, 'CLOSED', 'em-amal 314, 330 King St E; Sept 23, 09', 'STREET/ADDRESS', 213677, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (468, 591, 'CLOSED', 'Add 1 Red Fox Pl', 'STREET/ADDRESS', 213685, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (522, 646, 'CLOSED', 'em-add 860 Eglinton Av E; entr for 856; Oct 15, 09', 'STREET/ADDRESS', 213724, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (523, 647, 'CLOSED', 'em-add 50-88 Eastdale Av; Oct 15, 09', 'STREET/ADDRESS', 213725, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (556, 682, 'CLOSED', 'mm-fix loc Remembrance Dr at Lake Shore Blvd W/Ontario Dr, fix f.code and Jurisd/APSetData/FldChkd-27Oct2009', 'STREET/ADDRESS', 213757, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (557, 683, 'HOLD', 'em-add Bob Yuill Dr (etc) former 2277-2295 Sheppard Av West, Oct 9, 09', 'STREET/ADDRESS', 205443, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (558, 681, 'IN PROGRESS', 'em-17 Anndale Dr, res condo, add 38-70 Glendora Av - towns, and 19 Anndale Dr - towns, Oct 30, 09', 'STREET/ADDRESS', 205443, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (577, 702, 'CLOSED', 'Ld/55J23-add Dairy Dr, John Bell Cres & Ethel Bell Terrace at south of Bell Estate Rd - Plan 66M2469/ML 13June2008/iMaint cadastral', 'STREET/ADDRESS', 213770, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (585, 710, 'CLOSED', 'Renaming portion of East Don River Trail to Betty Sutherland Trail.', 'STREET/ADDRESS', 213774, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (608, 733, 'CLOSED', 'em-add 2394 Weston Rd; Mallaby Park; Dec 11, 09', 'STREET/ADDRESS', 213791, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (639, 765, 'CLOSED', 'ld/ redigitized Dundalk Dr at Ellesmere Rd', 'STREET/ADDRESS', 213808, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (683, 809, 'CLOSED', 'ld/move to fix intersection St Nicholas St at Charles St W & St Mary St-Cadstral', 'STREET/ADDRESS', 213842, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (715, 841, 'CLOSED', 'ld/-editing linear Humbercrest Lane', 'STREET/ADDRESS', 213861, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (725, 851, 'CLOSED', 'em-add 152A, 162, 166, 170 King St E, 57 Jarvis St; Feb 17, 2010', 'STREET/ADDRESS', 213868, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (742, 869, 'IN PROGRESS', 'Adding one-way streets to Bastion St and Sloping Sky Mews', 'STREET/ADDRESS', 207144, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (747, 874, 'CLOSED', 'ld/53J13-Adding laneway N of Mortimer, E of Binswood, W of Woodbine Ave- Apset 53J13/cadastral/google maps/LIT Winter mapping for 311 project.', 'STREET/ADDRESS', 207186, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (758, 885, 'CLOSED', 'WAITING - LIT re:problem editing linear''s label fr ted rogers Way to Ted Rogers Way(caps&lower case).', 'STREET/ADDRESS', 213893, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (767, 895, 'CLOSED', 'ld/ Torlet 24Feb2010 - add 2A Locust St. expire 1183A Weston Rd-Bins', 'STREET/ADDRESS', 213897, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (772, 900, 'CLOSED', 'ld /del 42R D''Arcy St. Parcels have been amalgamated to 42 D''Arcy St-Torlet 4Mar2010/FC', 'STREET/ADDRESS', 213902, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (781, 909, 'CLOSED', null, 'STREET/ADDRESS', 213913, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (801, 929, 'CLOSED', 'em-amal 776, 778 Annette St, into 778Annette St, March 17, 2010', 'STREET/ADDRESS', 213927, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (809, 937, 'CLOSED', 'ld/add Colborne Lodge(Howard House) to 11 Colborne Lodge Dr-Torlet 22Nov2004', 'STREET/ADDRESS', 213934, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (884, 1014, 'CLOSED', 'em-tech cofa 152 Annette St, 194 Medland St, April 26, 2010', 'STREET/ADDRESS', 213984, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (949, 1081, 'CLOSED', 'JF-1613 Bayview Av, May 17, 2010 ', 'STREET/ADDRESS', 214020, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (957, 1089, 'CLOSED', 'em-add 2325-2347 McNicoll Av; entr; in house; May 25, 2010', 'STREET/ADDRESS', 214024, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (986, 1118, 'CLOSED', 'dm - add park name - Upper Junction Park - e-mail ltr 06/04/10', 'STREET/ADDRESS', 214043, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1000, 1132, 'CLOSED', 'mm-modify CPR to PlannBndry along Morningside Ave(trail to be build)/Cadastral/PhotoMap2009', 'STREET/ADDRESS', 214052, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1006, 1138, 'HOLD', 'em-cofa; 2791Victoria Park Av into 2791 VPA, 28, 30, 32 Leafield Dr; June 16, 2010', 'STREET/ADDRESS', 209120, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1031, 1164, 'IN PROGRESS', 'Changing one-way on Emily Street from a point 71 metres north of Wellington Street West and King Street West', 'STREET/ADDRESS', 209259, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1040, 1174, 'IN PROGRESS', 'Changing one-way on Fuller Avenue from Pearson Avenue and a point 54.8 metres north of Queen Street West', 'STREET/ADDRESS', 209291, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1042, 1177, 'IN PROGRESS', 'Changing one-way on Howland Avenue from a point 76.2 metres south of Dupont Street and Barton Avenue', 'STREET/ADDRESS', 209301, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1056, 1192, 'IN PROGRESS', 'Changing one-way on Major Street from a point 33.0 metres north of Harbord Street and Sussex Avenue', 'STREET/ADDRESS', 209361, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1128, 1268, 'HOLD', 'em-add 3950 Keele St; pt of 3940; Finch Av W Subway, west entr; July 28, 2010', 'STREET/ADDRESS', 209973, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1129, 1269, 'HOLD', 'em-amal 3941, 3955 and 3965 into 3965 Keele St; Finch Av West Subway (east entr and bus terminal) July 28, 2010', 'STREET/ADDRESS', 209973, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1130, 1270, 'CLOSED', 'em-add 3630 Kingston Rd; prop park; Councillor Fred Johnson Park; July 26, 10', 'STREET/ADDRESS', 214098, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1167, 1308, 'CLOSED', 'mm-del Ln S Queen E Close - untravelled/PhotoMap2009', 'STREET/ADDRESS', 214126, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1168, 1309, 'CLOSED', 'em-add 2A Market St, 14, 21 Lower Jarvis St, 7 Lower Sherbourne St, 27 Parliament St, 385 Cherry St, 48, 49, 51 Strachan Av, 226 Bremner Blvd, Go Transit gates; Aug 140, 2010', 'STREET/ADDRESS', 214127, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1173, 1314, 'CLOSED', 'mm-fix centre-lines loc private lanes at 825 Dundas St E/TOLet-1Aug2008', 'STREET/ADDRESS', 214132, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1185, 1326, 'IN PROGRESS', 'Changing Euclid Avenue from First lane north of College Street and the first lane south of Ulster Street', 'STREET/ADDRESS', 210397, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1188, 1329, 'CLOSED', 'mm-modify parks name at 2115 Lake Shore Blvd W to Jean Augustine', 'STREET/ADDRESS', 214137, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1191, 1332, 'HOLD', 'em-cofa for 71 Burlingame Rd; add 69; Aug 30, 2010', 'STREET/ADDRESS', 210424, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1231, 1375, 'HOLD', 'JF-52 Sumach St, 25 Bright St, August 13, 2010', 'STREET/ADDRESS', 210691, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1232, 1376, 'HOLD', 'JF-327 Dixon Rd, August 27, 2010', 'STREET/ADDRESS', 210691, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1233, 1377, 'CLOSED', 'mm-add every single ent addr to 100 Grandview Way/MPAC', 'STREET/ADDRESS', 214164, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1234, 1378, 'CLOSED', null, 'STREET/ADDRESS', 214165, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1245, 1389, 'CLOSED', 'ld/49K-edit Eleanor Ave to Oakwood Ave - BL 7674 Sept 12, 1924/ PIN 10452(LT)/GCC/km', 'STREET/ADDRESS', 214174, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1246, 1390, 'CLOSED', 'em-add 111 Ingram Dr; entr for 103; Sept 27, 2010', 'STREET/ADDRESS', 214175, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1258, 1402, 'CLOSED', 'mm-Sherlock Holmes Walk fix loc and jurisd; Pabst Lane ext to Don Mills Rd', 'STREET/ADDRESS', 214184, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1285, 1431, 'CLOSED', null, 'STREET/ADDRESS', 214209, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1316, 1463, 'CLOSED', 'ld/46P-delete 22-36 & 2-14 Needle Firway-Mpac/dup_range_addr_act_25rply-GCC', 'STREET/ADDRESS', 214235, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1318, 1465, 'HOLD', 'em-cofa/omb add 4A Midburn Av; 4-existing house; Nov 23, 10', 'STREET/ADDRESS', 211355, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1322, 1468, 'HOLD', 'em-sever 216, 220 Scarborough Golf Club Rd, add Jeremiah Lane addresses; Nov 25, 2010; B042-062/10SC; ', 'STREET/ADDRESS', 211378, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1329, 1476, 'CLOSED', 'mm-modify 24 Eva Rd to STR to 361 The West Mall/Assm', 'STREET/ADDRESS', 214247, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1360, 1508, 'CLOSED', 'em-add 6 Smithfield Drive, Jan 7, 2011', 'STREET/ADDRESS', 214273, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1361, 1507, 'CLOSED', 'em-add 126 The West Mall, Jan 7, 2011', 'STREET/ADDRESS', 214272, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1369, 1516, 'IN PROGRESS', 'Adding Gatineau Hydro Corridor Trail between CONLINS RD and MEADOWVALE RD and ELLESMERE RD between MILITARY TRL and SCARBOROUGH GOLF CLUB RD', 'STREET/ADDRESS', 211793, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1370, 1517, 'IN PROGRESS', 'Adding Finch Corridor Trl between MIDDLEFIELD RD and KENNEDY RD', 'STREET/ADDRESS', 211794, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1384, 1531, 'CLOSED', 'mm-Duthie St - modify to temp stub(keep existing addrs) to be deleted later when addrs renumbered/Cadastral/Letter 11Jan2011', 'STREET/ADDRESS', 214285, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1465, 1612, 'CLOSED', 'mm-Elphick Lane, Conron Pl fix loc/Cadastral', 'STREET/ADDRESS', 214339, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1466, 1613, 'IN PROGRESS', 'Revising Finch Corridor Trail west of Bathurst St', 'STREET/ADDRESS', 212754, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1475, 1622, 'CLOSED', 'em-add 464 Bloor St W, entr for 468; March 1, 2011', 'STREET/ADDRESS', 214345, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1476, 1623, 'COMPLETED', null, 'STREET/ADDRESS', 212818, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1488, 1636, 'IN PROGRESS', 'ld/48G-adding Geostatistical Line-Planning Boundary-for Police Division/Zone boundaries updates-req by IT/BWalker.', 'STREET/ADDRESS', 212918, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1494, 1643, 'IN PROGRESS', 'JF-MM-73 Sixteenth St, February 11, 2011', 'STREET/ADDRESS', 212979, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1498, 1647, 'CLOSED', null, 'STREET/ADDRESS', 214358, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1502, 1651, 'CLOSED', 'dm - move 1 to 33 Hearth Pl to correct parcels - SC ltr Aug 12/09', 'STREET/ADDRESS', 214359, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1523, 1673, 'COMPLETED', 'em-add 101, 107 Erskine Av, 66 Broadway Av-prime; March 24, 2011', 'STREET/ADDRESS', 213151, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1524, 1672, 'IN PROGRESS', 'em-add 1 Leslie St , Tommy Thompson Park; March 24, 2011', 'STREET/ADDRESS', 213151, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (38, 132, 'CLOSED', 'em-25 Mendelssohn St prime-prop comm centre, 30 Howe Av entr for 25 Mendelssohn St, prop park; lett Nov 25, 2008;', 'STREET/ADDRESS', 213364, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (63, 156, 'CLOSED', 'dm-modify 28, 38, 50, 60 Estate Dr', 'STREET/ADDRESS', 213380, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (64, 158, 'CLOSED', '50H13-Del 657 & mod to LSSE 661 University Ave-Torlet4Dec08', 'STREET/ADDRESS', 213382, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (92, 190, 'CLOSED', 'mm 50K Add 149A Highbourne Rd,entr to 149/SolidWasteBin/MPAC', 'STREET/ADDRESS', 213405, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (94, 192, 'CLOSED', 'mm 60M Modify PlanBndry to Evenwood Ave/APSETdata/PhotoImagery2005', 'STREET/ADDRESS', 213407, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (95, 193, 'CLOSED', 'dm- adding intersection - Orton Park Rd for Stableford Cres extension - torlet Jan 14/08', 'STREET/ADDRESS', 200504, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (96, 194, 'CLOSED', 'dm - formally Stableford Cres renamed Curran Hall Cres', 'STREET/ADDRESS', 213408, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (102, 202, 'IN PROGRESS', 'em-amal 524, 528, 530, 534 St Clair Av W; 530-res condo, 518-commer condo; 526 entr for retail uni;', 'STREET/ADDRESS', 200558, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (110, 211, 'CLOSED', 'mm 49J Modify 1000 Dupont St, del 1000-1020/MPAC/FldChkd9Feb2009', 'STREET/ADDRESS', 213417, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (125, 227, 'CLOSED', 'ld-Merge 20 & 20X to 20 Jeffton Cres-duplicate addr', 'STREET/ADDRESS', 213430, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (129, 231, 'CLOSED', 'ld/50H-add 33 35 37 41 Ryerson Ave-LIM/SW', 'STREET/ADDRESS', 201003, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (140, 243, 'CLOSED', 'em-add 1119 Queen St W, city-owned parking; pt of untravelled Abell St;Tor lett March 10, 2009;', 'STREET/ADDRESS', 213442, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (156, 264, 'CLOSED', 'dm- add Hainford St with addresses 80-179 -55J-scarlet Sep11/08', 'STREET/ADDRESS', 213454, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (158, 270, 'HOLD', 'JF add 8 The Esplanade as a proposed L,S,SE for 1 Front St East ', 'STREET/ADDRESS', 201471, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (168, 281, 'CLOSED', 'JF - MM - 1 Carlingview Dr - Add 285 Skyway Av and 33 Carlingview Dr, February 24, 2009', 'STREET/ADDRESS', 213462, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (182, 295, 'CLOSED', null, 'STREET/ADDRESS', 213470, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (193, 306, 'HOLD', 'JF - Add 25 Starfire Dr ', 'STREET/ADDRESS', 201953, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (201, 314, 'CLOSED', 'em-bh letter April 7, 2009; renumber 11 Duncan St to 11 Ed Mirvish Way effective April 15, 2009;', 'STREET/ADDRESS', 213481, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (213, 326, 'CLOSED', 'dm - adding 170  to 182 Bonis Ave - e-mail ltr 04/07/09 / field check', 'STREET/ADDRESS', 213491, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (215, 328, 'CLOSED', 'mm-add laneway/ By-Law 955-2008', 'STREET/ADDRESS', 213493, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (236, 351, 'CLOSED', 'em-add 168 Erskine Av for 170 Erskine Av; April 23, 2009', 'STREET/ADDRESS', 213507, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (237, 353, 'CLOSED', 'em-assign/reassign 402, 404, 406 Livingston Road North; April 23, 2009', 'STREET/ADDRESS', 213509, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (238, 352, 'CLOSED', 'em-assign 14 John St; April 22, 2009', 'STREET/ADDRESS', 213508, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (239, 348, 'CLOSED', 'em-amal 202 and 204 Bathurst St; 204 entr for 202; April 22, 2009', 'STREET/ADDRESS', 213505, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (240, 354, 'HOLD', 'em-assign 185 Oasis Blvd; April 23, 2009, JF-DM-January 7 and 21, 2011', 'STREET/ADDRESS', 202479, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (287, 406, 'CLOSED', 'em-add 183 Vaughan Rd; entr for 181; May 28, 2009', 'STREET/ADDRESS', 213545, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (314, 434, 'HOLD', 'JF-MM-Sever 19 Maple Bush Av June 15, 2009', 'STREET/ADDRESS', 203374, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (319, 439, 'HOLD', 'JF-MM-Add 108 Dunblaine Av, March 5, 2009', 'STREET/ADDRESS', 203418, -1);
--commit;
--PROMPT 1500 records committed...
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (336, 456, 'HOLD', 'em-CofA 20 Lunness Rd; Aug 14, 2009', 'STREET/ADDRESS', 203687, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (337, 457, 'HOLD', 'em-CofA 251 Chisholm Av; Aug 12, 2009', 'STREET/ADDRESS', 203687, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (342, 462, 'CLOSED', 'Modify feature codes in High Park-Rd reclass/vesna emailed 25May2009', 'STREET/ADDRESS', 213585, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (343, 463, 'HOLD', 'em- cofa 57A and 59 Grange Av; Aug 17, 2009; conveyance', 'STREET/ADDRESS', 203749, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (346, 466, 'HOLD', 'JF-MM-Add 218,220,222 Horsham Av - April 9, 2009', 'STREET/ADDRESS', 203779, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (378, 500, 'CLOSED', 'ld/Delete part (w/ barrier)of Rosemary Rd', 'STREET/ADDRESS', 213606, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (447, 571, 'COMPLETED', 'JF-MM-Add 217AB Aldercrest Rd, April2 , 2009', 'STREET/ADDRESS', 204610, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (448, 570, 'HOLD', 'JF-MM-Add 229 Willow Av, September 17, 2009', 'STREET/ADDRESS', 204610, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (455, 578, 'CLOSED', 'mm-Del untravelled laneway/Fld chkd 22Sep2009', 'STREET/ADDRESS', 213673, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (477, 600, 'CLOSED', 'ld/edit 9X to 9 Westroyal Rd/Mpac/yelw/cadastral/LIT-km', 'STREET/ADDRESS', 213689, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (485, 608, 'CLOSED', 'em-add 20 St Magnus Dr; assigned; Oct 6, 2009', 'STREET/ADDRESS', 213695, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (488, 611, 'CLOSED', 'McCowan District Park Bicycle Pathway', 'STREET/ADDRESS', 213698, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (501, 624, 'CLOSED', 'em-add 47-93 Firvalley Court, Oct 14, 2009; entr for 1-71 Cataraqui Cres;', 'STREET/ADDRESS', 213707, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (517, 641, 'CLOSED', 'em-add 18 Finch Av West, entr for 2; Oct 16, 09', 'STREET/ADDRESS', 213722, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (518, 640, 'CLOSED', 'em-add 2843 Dufferin St, entr for 2841; Oct 15, 09', 'STREET/ADDRESS', 213721, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (524, 648, 'CLOSED', 'em-add 1A Paulson Rd; Green Hills Park; Oct 26, 09', 'STREET/ADDRESS', 213726, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (597, 722, 'CLOSED', 'Adding sections of Beltline Trail for 2010 Updates to Cycling Project.', 'STREET/ADDRESS', 213784, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (605, 730, 'CLOSED', 'Ld-Move 60 Garnet Ave', 'STREET/ADDRESS', 213788, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (654, 780, 'CLOSED', 'mm-Angelique St - del temp stub, add street/PhotoImagery2009', 'STREET/ADDRESS', 213819, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (680, 806, 'CLOSED', 'mm-modify 3 laneways to St Luke Lane, Lot Street Lane and Cottage Lane/By-Laws 800,809,822/2009', 'STREET/ADDRESS', 213840, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (684, 810, 'CLOSED', 'em-add 59B, 61B Milvan Dr; Feb 3, 2010', 'STREET/ADDRESS', 213843, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (685, 812, 'CLOSED', 'em-add 2 Lake Cr, Lake Crescent Road End Parkette; Feb 3, 10', 'STREET/ADDRESS', 213845, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (686, 811, 'CLOSED', 'em-add 32 Willard Gdns, entr for 55 Mayfield Av; Willard Gardens Parkette; Feb 3, 10', 'STREET/ADDRESS', 213844, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (730, 857, 'CLOSED', 'ld/45N-Expire Name Tor Pol Div 23 to 2126 Kipling Ave-TorPol web & SBriellemailed 19Feb2010', 'STREET/ADDRESS', 213873, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (766, 894, 'CLOSED', 'em-add 64 Olga St; IGE temp address; March 4, 2010', 'STREET/ADDRESS', 213896, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (797, 925, 'IN PROGRESS', 'em-amal 17, 19, 21, 23 Clairtrell Rd, 391 Spring Garden Av; res condo 21 Clairtrell Rd; March 18, 2010', 'STREET/ADDRESS', 207614, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (817, 947, 'CLOSED', 'em-amal 286 King St E and 501 Adelaide St E into 501 Adelaide St E, add entr 288 King St E; March 24, 2010', 'STREET/ADDRESS', 213942, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (847, 975, 'CLOSED', 'em-change 422-422A Dawes Rd to 422; add entr 422A; April 8, 2010', 'STREET/ADDRESS', 213962, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (848, 976, 'CLOSED', 'mm-add Ww S Avondale E Everson/Cadastral/Plan 66M-2354', 'STREET/ADDRESS', 213963, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (849, 977, 'CLOSED', 'mm-add Leafield Dr-ext/Plan 66M-2477/Cadastral', 'STREET/ADDRESS', 213964, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (864, 992, 'CLOSED', 'em-assign 48 Sunnydene Cres; March 30, 2010', 'STREET/ADDRESS', 213970, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (964, 1096, 'CLOSED', 'dm - add unique addr/geoid - Raintree Path / Redstone Path -YO ltr May 26/10', 'STREET/ADDRESS', 214029, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (994, 1129, 'IN PROGRESS', 'Adding one-way on Colborne Lodge Drive South of West Road to the southern most limit of the traffic island in the turning circle delineated by heavy lines on Map 4 at the end of this by-law', 'STREET/ADDRESS', 209008, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (995, 1126, 'IN PROGRESS', 'Adding westbound one-way street on Wilton Street between Market Street and Jarvis Street', 'STREET/ADDRESS', 209008, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (996, 1127, 'CLOSED', 'em-add 8 Manorpark Crt; city-owned; June 9, 2010', 'STREET/ADDRESS', 214048, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (997, 1128, 'CLOSED', 'em-add 250 Duncan Mill Rd, 1295 Sheppard Av E, 2 Manorpark Crt; Betty Sutherland Trail; June 9, 2010', 'STREET/ADDRESS', 214049, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1061, 1199, 'IN PROGRESS', 'Changing one-way on Northumberland Street from Westmoreland Avenue and a point 34.7 metres east', 'STREET/ADDRESS', 209406, -1);
insert into IGE_CONTROL_TASK (control_task_id, source_id, control_task_status, control_task_comments, control_task_type, trans_id_create, trans_id_expire)
values (1069, 1208, 'IN PROGRESS', 'Changing one-way on Pearl Street from a point 59.4 metres west of York Street and John Street', 'STREET/ADDRESS', 209455, -1);
--commit;
--PROMPT 1538 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
