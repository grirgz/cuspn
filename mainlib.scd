(

~exec_absolute_file = { arg path, skip_first_assign=false;
	var res = path;
	path.debug("Try loading buffer file");
	if(File.exists(res)) {
		var file;
		var code;
		var end;
		File.use(res, "r", { arg file;
			code = file.readAllString;
		});
		end = code.find("// END");
		if(end.notNil) {
			code = code.keep(end);
		};

		if(skip_first_assign) {
			if(code.beginsWith("~name =")) {
				//code.debug("BEFORE=======================================================================");
				code = code.drop(code.find("\n")+1);
				//code.debug("AFTER=======================================================================");
			}
		};

		try {
			code.interpret;
			res.debug("Loaded buffer file");
		} { arg e;
			e.debug("ExC");
			e.throw;
			res.debug("Error when loading buffer file");
		};
	} {
		path.debug("execute_till_special_end: File don't exists");
	}
};

~exec_node = { arg name;
	var path = ~cuspn_project_path +/+ ~current_project_name +/+ (name.asString ++ ".scd");
	~exec_absolute_file.(path);
};

~exec_file = { arg name;
	var path = ~cuspn_project_path +/+ ~current_project_name +/+ name.asString;
	~exec_absolute_file.(path);
};

)
