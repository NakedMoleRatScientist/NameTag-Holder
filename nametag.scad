//Index card holder
use <vendors/UtilitySCAD-R1/utility.scad>;

$fa = 1;
$fs = 0.1;
height = 76.2;
width = 127;
border = 5;

thickness = 3;
r = 9;
nail_r = 3.3;
module back_plate()
{
    move_y(2)
    {
        cube([width + 3,5,height + 1]);
    }
}

module frame()
{
    move_y(1)
    {
        //left side
        cube([1,1,height + 1]);
        move_x(width + 2)
        {
            //right side
            cube([1,1,height + 1]);
        }
        //bottom
        cube([width + 2,1,1]);
    }

    cube([border,1,height + 1]);
    cube([width + 2,1,border]);
    move_x(width - 2)
    {
        cube([border,1,height + 1]);
    }
}




//difference()
//{
//    back_plate();
//    center_z(r * 2,height)
//    {
//        move_y(3)
//        {
//            center(24,width)
//            {
//               mag_holder();
//            }
//        }
//    }
//}
//frame();

module mag_holder()
{
    center(r * 2,24)
    {

            center_z(r * 2,24)
            {
                hull()
                {
                    hor_cylinder_y(thickness,r);
                    move_z(r * 2)
                    {
                        hor_cylinder_y(thickness,r);
                    }
                }
                move_z(r * 2)
                {
                    hor_cylinder_y(thickness + 3,r);
                }
                center(5,r * 2)
                {
                    cube([5,5,20]);
                }
            }
        
    }
}


translate([150,0,0])
{
    wall_stud_w = 38;
    mag_h = 50;
    difference()
    {
        cube([wall_stud_w,7,mag_h]);
        move_y(3)
        {
            center(24,38)
            {
                mag_holder();
            }
        }
        translate([0,-1,mag_h - 8])
        {
            center(nail_r * 2, wall_stud_w)
            {
                hor_cylinder_y(7.5,nail_r);
                translate([1,0,1])
                {
                    hor_cylinder_y(9,nail_r - 1);
                }
            }
        }
    }
    
}