--PROMPT PL/SQL Developer Export Tables for user IGE@MTA_DARLINGTON
--PROMPT Created by slee5 on July 9, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_MESSAGES...
truncate table IGE_MESSAGES;
--PROMPT Loading IGE_MESSAGES...
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90701, 'IGE', 'ERR', 'User does not belong to cadastal steward group', 'CEdit login user validation failed');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10617, 'LNRNM', 'ERR', 'Linear Name contains word starts with lower case! If it is legitimate; Please contact support to add "<linearname>" in linear_name_exception table.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90702, 'IGE', 'ERR', 'Version <name> cannot be deleted - it is currently in use', 'SDE rejected operation');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40628, 'NTWRK', 'ERR', 'Original Segment was on the city boundary. ID=<id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40631, 'NTWRK', 'ERR', 'Base elevations for start/end intersections for Planning Boundaries can only be Level 9.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60602, 'AAREA', 'ERR', 'Invalid id <ID>.  Must be numeric and 3 characters.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40627, 'NTWRK', 'ERR', 'Segment is outside the boundary of the city', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60000, 'AAREA', 'INFO', 'VS Id <VS_ID> is not unique for subdivision <area_id>. ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60001, 'AAREA', 'INFO', 'VS Id <VS_ID>  does not have a valid Primay voting location.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60002, 'AAREA', 'INFO', 'VS Id <VS_ID> has Secondary voting locations outside the subdivision.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60003, 'AAREA', 'INFO', 'VS Id <VS_ID> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60004, 'AAREA', 'INFO', 'VL Id <VL_ID> has more than 1 Primary voting location.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60005, 'AAREA', 'INFO', 'VL Id <VL_ID> is not unique for voting location.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60006, 'AAREA', 'INFO', 'VL Id <VL_ID> is a Secondary voting location outside the subdivision.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60007, 'AAREA', 'INFO', 'VL Id <VL_ID> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60008, 'AAREA', 'INFO', 'VL Id <VL_ID> is not unique for voting location.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40629, 'NTWRK', 'ERR', 'Segment must be renamed to Planning Boundary.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40630, 'NTWRK', 'ERR', 'Segment cannot be added outside of the city boundary.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40633, 'NTWRK', 'ERR', 'Intersection is outside of the city boundary.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40626, 'NTWRK', 'ERR', 'Split and merge operations may not occur in same transaction for segment(s) <id>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30633, 'ADDR', 'ERR', 'Address point is outside the boundary of the city.  id=<id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30634, 'ADDR', 'ERR', 'Address point is inside the boundary of the city BLOCK_ID=<id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30635, 'ADDR', 'ERR', 'Address point ID=<id>  SIDE:<side>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60600, 'AAREA', 'ERR', 'Voting subdivisions must be adjacent to one another.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60601, 'AAREA', 'ERR', 'Invalid polyline/polygon for splitting subdivision.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (60603, 'AAREA', 'ERR', 'Invalid VL Id <ID>.   Secondary voting locations can not have same Subdivision Id..', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70656, 'SAREA', 'ERR', 'Invalid Source for this Site Area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30626, 'ADDR', 'ERR', 'The Address Point <Address Point> is not in Reserved Maintenance Stage. Please contact support!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30627, 'ADDR', 'ERR', 'The Reserved Address Point Id <id> is not associated with a Source Site Area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30628, 'ADDR', 'ERR', 'Reserved Address Point Id <id> must reside in the Source Site Area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30629, 'ADDR', 'ERR', 'Reserved Address Point id <id> must reside in same Source Site Area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40003, 'NTWRK', 'INFO', 'Linear name change from <linearName1> to <linearName2> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40004, 'NTWRK', 'INFO', 'Rename segment <centrelineId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40005, 'NTWRK', 'INFO', 'Segments are valid for deletion.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10000, 'LNRNM', 'INFO', 'Linear Name with ID of <linearNameId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10001, 'LNRNM', 'INFO', 'LInear Name Type <linearNameTypeId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10002, 'LNRNM', 'INFO', 'Linear Name Direction <directionId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70000, 'SAREA', 'INFO', 'Site Area <sideAreaId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50667, 'SURCTSK', 'ERR', 'Source Id <srcId>  new external_source_id <externalNo> is not unique', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50668, 'SURCTSK', 'ERR', 'Source Id <srcId> existing external_source_no <externNo> can not be EMPTY', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90605, 'IGE', 'ERR', 'Steward Username already exists', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90606, 'IGE', 'ERR', 'Status cannot be set to Expired', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90607, 'IGE', 'ERR', 'Invalid Objects Detected in Post-Validation', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90608, 'IGE', 'ERR', 'Version Conflict Detected in Post', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90609, 'IGE', 'ERR', 'Post System Error', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30630, 'ADDR', 'ERR', 'Associated Segment Address Range  of Address Point Id  <id> overlaps with Centreline Id <CentrelineId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30631, 'ADDR', 'ERR', 'Associated Segment Address Parity of Address Point Id <id>  should not be both Odd and Even.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70600, 'SAREA', 'ERR', 'Site Area may not overlap existing site areas.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70601, 'SAREA', 'ERR', 'Site Area must contain one or more Regular Addresses.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50657, 'SURCTSK', 'ERR', 'Edit Task is only allowed while status is: ''CREATED'', ''READY'' or ''TAKEN''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40619, 'NTWRK', 'ERR', 'Start and end intersection can not be the same.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40621, 'NTWRK', 'ERR', 'Error generating turn, rolling back.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40622, 'NTWRK', 'ERR', 'Can not move to existing intersection.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50664, 'SURCTSK', 'ERR', 'Hold Task is only allowed while status is: ''READY'' or ''TAKEN''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50669, 'SURCTSK', 'ERR', 'Source Id <srcId> is parent of an existing source', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50670, 'SURCTSK', 'ERR', 'Source Id <srcId> is associated with an existing control task', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50671, 'SURCTSK', 'ERR', 'Source Id <srcId> is associated with an existing task', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50672, 'SURCTSK', 'ERR', 'Source Id <srcId> is associated with an existing site area cp_application_id=<appId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50651, 'SURCTSK', 'ERR', 'Source Id <src_id> does not exist.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70640, 'SAREA', 'ERR', 'Can not find Site Area <siteAreaId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70642, 'SAREA', 'ERR', 'Site Area <siteAreaId> can not be set to Current Without Parcel', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70643, 'SAREA', 'ERR', 'Site Area <siteAreaId> must be Current Without Parcel', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70644, 'SAREA', 'ERR', 'Site Area <siteAreaId> must be Current With Parcel', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70647, 'SAREA', 'ERR', 'Application id <appId> already has a site area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70649, 'SAREA', 'ERR', 'Site Area <siteAreaId> can not have a segment with system coded name.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70650, 'SAREA', 'ERR', 'Site Area <siteAreaId> must have at least 1 reserved address point with Land class.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70651, 'SAREA', 'ERR', 'Parcel <parcelId> should have only 1 reserved address point with Land class.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70652, 'SAREA', 'ERR', 'All Regular Addresses of a family for address <land_address> must reside within same Site Area <siteArealId>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70653, 'SAREA', 'ERR', 'At least one Regular Address Point must exist in Site Area <SiteAreaId>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70654, 'SAREA', 'ERR', 'At least one of the Regular Address Points must be Land Class in Site Area <SiteAreaId>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50660, 'SURCTSK', 'ERR', 'Control Task of Task <task_id> does not exist.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50661, 'SURCTSK', 'ERR', 'Task can only be ready while associated Control Task status is: ''READY'' or ''IN PROGRESS''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10609, 'LNRNM', 'ERR', 'Invalid Approval Status', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50662, 'SURCTSK', 'ERR', 'Close Control Task is only allowed when task list is EMPTY or all task are ''COMPLETED'' ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50663, 'SURCTSK', 'ERR', 'Reassign Business Task is only allowd while status is: ''POST FAILED'',''WORK STARTED'' or ''WORK STOPPED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30619, 'ADDR', 'ERR', 'Address id <Address_Point_id> should reside in parcel that is condo or common.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70645, 'SAREA', 'ERR', 'Site Area must have valid cp_application_id.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70646, 'SAREA', 'ERR', 'Reserved address points can not be outside Site Area <siteAreaId>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10613, 'LNRNM', 'ERR', 'Activation Status cannot be set to ''EXPIRED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40623, 'NTWRK', 'ERR', 'Deleting vertex results in invalid line.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70602, 'SAREA', 'ERR', 'Site Area polygon may not be self intersecting.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50652, 'SURCTSK', 'ERR', 'Control Task Id <control_task_id> does not exist', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50653, 'SURCTSK', 'ERR', 'Control Task can only be ready while status is: ''INITIALIZED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50654, 'SURCTSK', 'ERR', 'Close Control Task is only allowed while status is: ''INITIALIZED'', ''READY'', ''HOLD'' or ''COMPLETED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70648, 'SAREA', 'ERR', 'Segments with System named linear name must reside in Site Area <site_area_id> .', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40624, 'NTWRK', 'ERR', 'Geostatistical Segment <Centreline_id> can not be deleted.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40001, 'NTWRK', 'INFO', 'Intersection <intersectionId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40002, 'NTWRK', 'INFO', 'Segment <centrelineId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50665, 'SURCTSK', 'ERR', 'Task Sequence cannot be earliar then an existing task of status: ''WORK STARTED'',''WORK STOPPED'',''POSTING'',''POST FAILED'',''POSTED'', or ''COMPLETED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50673, 'SURCTSK', 'ERR', 'Delete Task is not allowed while it is related to a existing IGE Trasaction', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70001, 'SAREA', 'INFO', 'Abandoning the Site Area will expire the area and all reserved addresses within.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70002, 'SAREA', 'INFO', 'Completing the Site Area will expire the area and all regular land addresses within and transfer reserved addresses to regular.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10610, 'LNRNM', 'ERR', 'Invalid Name - cannot rename to a System Coded Name - starting with "STD"', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30606, 'ADDR', 'ERR', 'Failed to get Address Class Id for Address Point=<PointId>, Class=<Class>!', 'Either Address Point id and/or Class are invalid.');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50602, 'SURCTSK', 'ERR', '"Start Work" on Task <task_id> is not allowed while status is: <status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40603, 'NTWRK', 'ERR', '<Parity> ranges are overlapping.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (20600, 'AMA', 'ERR', 'Invalid Authorized Municipal Address Domain Name: <Requested Domain>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30620, 'ADDR', 'ERR', 'Municipal Parcel Id <id> should have only one Regular Address Point with land class.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50002, 'SURCTSK', 'INFO', 'No steward group is selected', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30618, 'ADDR', 'ERR', 'Regular Address Point Id <id> should reside in a Municipal Parcel.', null);
--commit;
--PROMPT 100 records committed...
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30616, 'ADDR', 'ERR', 'Address <addr_id> has decendants(<childIds>) that are not in the deletion list', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50629, 'SURCTSK', 'ERR', '"Start Work" on Task <task_id> requires other tasks with lower sequence to be completed first.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40602, 'NTWRK', 'ERR', 'Segment <Centreline_id> can not be deleted until <address_points> addresses are removed from this segment', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90600, 'IGE', 'ERR', 'Non-IGE User or Not Active', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90601, 'IGE', 'ERR', 'User does not belong to any steward group', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90602, 'IGE', 'ERR', 'Empty Startup Action Menu', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30610, 'ADDR', 'ERR', 'The Address Point <Address Point> is not in Regular Maintenance Stage. Please contact support!', 'Regular Address Point Validation Error: The incorrect Address Point was past.');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30611, 'ADDR', 'ERR', 'Invalid General Use <General Use>!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30612, 'ADDR', 'ERR', 'Address Point <AddressPoint> with invalid Centreline Id <CentrelineId>!', 'Failed Address Validation with invalid Centreline Id.');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30613, 'ADDR', 'ERR', 'Address Point <AddressPoint> with invalid Address String Id <amaid>!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30614, 'ADDR', 'ERR', 'Warning: Address Point low number sequence is out of order!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30617, 'ADDR', 'ERR', 'Address Class "<conflict Class>" conflict with Regular Address Point <pid> class.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40600, 'NTWRK', 'ERR', 'Invalid Id Name <IdName> entered! Failed to generate id.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10601, 'LNRNM', 'ERR', 'Duplicated Linear Name Type <nametype>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10602, 'LNRNM', 'ERR', 'Duplicated Linear Name Type Abbreviation <abbreviation>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10603, 'LNRNM', 'ERR', 'Linear Name Type <nametype> is in use and can not be changed', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90603, 'IGE', 'ERR', 'Invalid Task Id <task_id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90604, 'IGE', 'ERR', 'Invalid Version Name <version_name>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10604, 'LNRNM', 'ERR', 'Duplicated Linear Name Direction <direction>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10605, 'LNRNM', 'ERR', 'Duplicated Linear Name Direction Code <direction_code>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10606, 'LNRNM', 'ERR', 'Linear Name Direction <direction> is in use and can not be changed', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10607, 'LNRNM', 'ERR', 'Duplicated Linear Name <linearname>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10608, 'LNRNM', 'ERR', 'Additional Linear Name must be referenced by valid Prinicipal Linear Name <linearNameId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40604, 'NTWRK', 'ERR', 'There is more than one elevation at intersection <id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40605, 'NTWRK', 'ERR', 'There is more than two connected segments at intersection <id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40606, 'NTWRK', 'ERR', 'The common segment attributes are not the same for segments <segments>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40607, 'NTWRK', 'ERR', 'Digitizing direction is not the same for segments <segments>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10600, 'LNRNM', 'ERR', 'Invalid Linear Name Domain Name: <Requested Domain>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30625, 'ADDR', 'ERR', 'Regular Address Point id <id> should reside in same Municipal Parcel.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50000, 'SURCTSK', 'INFO', 'No Task Is Selected', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50623, 'SURCTSK', 'ERR', 'You are already working on task <task_id>. Only one task can be under "Work Started" status at a time.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50624, 'SURCTSK', 'ERR', '"Reset Task" on Task <task_id> is not allowed while status is:<status> ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30607, 'ADDR', 'ERR', 'Failed Regular Address Validation: Too many Address Class records for Address Point <AddressPointId>! Please contact support! ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30608, 'ADDR', 'ERR', 'Failed Regular Address Validation: Missing Address Class records for Address Point <AddressPointId>! Please contact support! ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30609, 'ADDR', 'ERR', 'Failed Regular Address Validation: Invalid Address Class linkage for Address Point <AddressPointId>! Please contact support! ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50622, 'SURCTSK', 'ERR', 'User is working on task <task_id> but no open transaction is available for this task', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50600, 'SURCTSK', 'ERR', 'Task <task_id> does not exist.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50601, 'SURCTSK', 'ERR', '' || chr(10) || 'Task can only be taken while status is "Ready"', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50625, 'SURCTSK', 'ERR', '"Return Task" on Task <task_id> is not allowed while status is: <status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50627, 'SURCTSK', 'ERR', '"Post Work" on Task <task_id> is not allowed while status is: <status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50628, 'SURCTSK', 'ERR', 'Invalid SourceTask Domain Name: <Requested Domain>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40608, 'NTWRK', 'ERR', 'Can not move start or end vertex', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40609, 'NTWRK', 'ERR', 'Can not move or add point to existing vertex', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40610, 'NTWRK', 'ERR', 'Vertex already exists', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40611, 'NTWRK', 'ERR', 'Line is self intersecting', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40612, 'NTWRK', 'ERR', 'Vertex is not on line', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40613, 'NTWRK', 'ERR', 'Line direction must be from start to end vertices', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40614, 'NTWRK', 'ERR', 'Start or end vertex does not snap to line', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40615, 'NTWRK', 'ERR', 'Can not delete start or end vertex', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40616, 'NTWRK', 'ERR', 'No vertex selected', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40617, 'NTWRK', 'ERR', 'Segment may not cross another segment', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30621, 'ADDR', 'ERR', 'No place name', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30622, 'ADDR', 'ERR', 'Duplicate place name exists', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30623, 'ADDR', 'ERR', 'More than one principle name', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30624, 'ADDR', 'ERR', 'One principle name is required', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40601, 'NTWRK', 'ERR', 'Address <Address1> and <Address2> are duplicates.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50650, 'SURCTSK', 'ERR', '"<operation>" on Task <task_id> is not allowed while status is: <task_status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50626, 'SURCTSK', 'ERR', '"Complete Task" on Task <task_id> is not allowed while status is: <status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30615, 'ADDR', 'ERR', 'Address Class "<conflict Class>" conflict with Reserve Address Point <pid> class.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90000, 'IGE', 'INFO', 'You have an uncompleted session starting from <login_time>. Do you want to terminate the uncompleted session and start a new session?', 'Login session warning');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (20601, 'AMA', 'ERR', '<count> Duplicate address(es) for Authorized Municipal Address <id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (20602, 'AMA', 'ERR', '<count> Range overlap(s) for Authorized Municipal Address <id>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30601, 'ADDR', 'ERR', 'Address Point Id <id> not found in GDB Version <v>!', 'Cause: Specified Address Id is not found in the GDB Version.');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30603, 'ADDR', 'ERR', 'Invalid XY Coordinates: <X>,<Y>!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30604, 'ADDR', 'ERR', 'Unable to find Former Municipality for XY-Coordinates: <x>,<y>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30605, 'ADDR', 'ERR', 'Invalid Id Name <IdName> entered! Failed to generate id.', 'Invalid Id Name specified!');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30602, 'ADDR', 'ERR', 'Unable to find Former Municipality for Address Point Id: <AddressPointId> in GDB Version <Version>.', 'Either the Address Point Id is invalid or Geometry is invalid.');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30600, 'ADDR', 'ERR', 'Invalid Address Domain Name: <Requested Domain>.', 'Enter valid Address Domain Name');
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50658, 'SURCTSK', 'ERR', 'DeleteTask is only allowed while status is: ''CREATED'' or ''READY''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50659, 'SURCTSK', 'ERR', 'Ready Task is only allowed while status is: ''CREATED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10611, 'LNRNM', 'ERR', 'Invalid Name -  names starting with "STD" are reserved for System Coded Names', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10612, 'LNRNM', 'ERR', 'Invalid Activation Status', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30632, 'ADDR', 'ERR', 'Invalid Address Class linkage. Class field ADDRESS_POINT_ID=<pointId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10614, 'LNRNM', 'ERR', 'Usage cannot be null', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50674, 'SURCTSK', 'ERR', 'Control Task can only be closed if associated site area external_source_no=<externalNo> contains a  status of  ''COMPLETED'' or ''Abandoned''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70620, 'SAREA', 'ERR', 'Invalid Site Area Domain Name: <Requested Domain>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50603, 'SURCTSK', 'ERR', '"Stop Work" on Task <task_id> is not allowed while status is: <status>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40625, 'NTWRK', 'ERR', 'Segments may not be renamed to Planning Boundary.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (30000, 'ADDR', 'ERR', 'Address <addressPointId> is valid.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50666, 'SURCTSK', 'ERR', 'Task is already assigned to user <userid>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70641, 'SAREA', 'ERR', 'Can not find Site Area with cp_application_id <appId>', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10615, 'LNRNM', 'ERR', 'Activation Status cannot be set to Pending since segments are assigned to this linear name.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (10616, 'LNRNM', 'ERR', 'Activation Status cannot be set to Pending since municipal numbers have been created against this linear name.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50655, 'SURCTSK', 'ERR', 'Reassign Task is only allowd while status is: ''TAKEN'', ''POSTED'',''POST FAILED'',''WORK STARTED'' or ''WORK STOPPED''', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (50656, 'SURCTSK', 'ERR', 'Reassign Task is not allowed on a task with an existing session!', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70655, 'SAREA', 'ERR', 'Invalid class combination for Regular address id <regAddress_id> and Reserved addresses.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70003, 'SAREA', 'INFO', 'Valid combination of address classes exists for Site Area.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40618, 'NTWRK', 'ERR', 'Polygon must have more than 3 vertices to delete vertex.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40620, 'NTWRK', 'ERR', 'Segment <id> with System named linear name must reside in the Source Site Area Application Id <appId>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40635, 'NTWRK', 'ERR', 'Cannot delete boundary segment  id=<id>.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (70657, 'SAREA', 'ERR', 'Reserved and regular addresses for <address> must be in same site area. ', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40634, 'NTWRK', 'ERR', 'Intersection <intersectionId> may not be within 3 metres of another intersection.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (40632, 'NTWRK', 'ERR', 'Segment <id> length is less than 3 metre tolerance.', null);
insert into IGE_MESSAGES (message_number, message_category, message_type, message, description)
values (90703, 'IGE', 'ERR', 'Posting job for Task <task_id> failed. Conflict with job queue: <type>', 'New psot for CEdit');
--commit;
--PROMPT 194 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
SELECT * FROM IGE_MESSAGES;