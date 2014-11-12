
(

(~cuspn_project_path +/+ "mainlib.scd").load;
~current_project_name = "fossil";
~exec_node.(\1);


);


~play_node.('1.1');
~stop_node.('1.1');

Pdef(\fossil1).play;
Pdef(\fossil1).stop;
