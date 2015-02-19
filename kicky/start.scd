
// cuspn test project


// init project
(

(~cuspn_project_path +/+ "mainlib.scd").load;
~current_project_name = "kicky";
~exec_node.(\1);


);

// END

// start / stop

"jeekj".postln;

~play_node.('1.1');

Pdef(\fossil1).play;
Pdef(\fossil1).stop;
