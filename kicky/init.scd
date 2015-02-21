Veco.load_lib("main.scd");

Veco.main.board_size = Point(32,64);
~set_default_quant.(0);
~set_project_tempo.(1);
~load_standard_quickpad.();
Veco.exec_file("start.scd");


// END

~define_effects.(['56','57','58','59']);
Veco.main.fadeout_time = 16;

