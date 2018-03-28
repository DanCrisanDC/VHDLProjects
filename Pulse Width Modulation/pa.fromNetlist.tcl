
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name PWM_NOU -dir "C:/Users/dan/Desktop/VERY SAFE COPY OF PWM PROJECT/planAhead_run_4" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/dan/Desktop/VERY SAFE COPY OF PWM PROJECT/TOP_LEVEL.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/dan/Desktop/VERY SAFE COPY OF PWM PROJECT} }
set_property target_constrs_file "TOP_LEVEL.ucf" [current_fileset -constrset]
add_files [list {TOP_LEVEL.ucf}] -fileset [get_property constrset [current_run]]
link_design
