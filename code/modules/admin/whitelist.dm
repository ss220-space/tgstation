#define WHITELISTFILE "[global.config.directory]/whitelist.txt"

GLOBAL_LIST(whitelist)
GLOBAL_PROTECT(whitelist)

/proc/load_whitelist()
	GLOB.whitelist = list()
	for(var/line in world.file2list(WHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		GLOB.whitelist += ckey(line)

	if(!GLOB.whitelist.len)
		GLOB.whitelist = null

/proc/check_whitelist(ckey)
	if(!CONFIG_GET(flag/usewhitelist_database))
		return (ckey in GLOB?.whitelist)

	if(!SSdbcore.Connect())
		message_admins(span_danger("Failed to establish database connection."))
		return FALSE

	var/datum/db_query/find_ticket = SSdbcore.NewQuery(
		"SELECT ckey FROM [CONFIG_GET(string/utility_database)].[format_table_name("ckey_whitelist")] WHERE ckey=:ckey AND is_valid=true AND port=:port AND date_start<=NOW() AND (NOW()<date_end OR date_end IS NULL)",
		list("ckey" = ckey, "port" = "[world.port]")
	)
	if(!find_ticket.warn_execute(async = FALSE))
		qdel(find_ticket)
		return FALSE
	if(!find_ticket.NextRow())
		qdel(find_ticket)
		return FALSE
	qdel(find_ticket)
	return TRUE

#undef WHITELISTFILE
