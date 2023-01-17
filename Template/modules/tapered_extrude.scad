TaperCube(X_Dim = 25.4, Y_Dim = 7, Z_Dim = 38.1);

// Tapered cube on one side straight on one side
module TaperCube(X_Dim, Y_Dim, Z_Dim, Taper_Big = 1, Small_Taper = .2, Center = true, )

{
    difference()
    {
        translate([ 0, -Y_Dim / 2, 0 ]) linear_extrude(height = Z_Dim, scale = [ Taper_Big, Small_Taper ],
                                                       center = true) // flattend tapered rod .093/.1642
            square(
                [
                    X_Dim,
                    Y_Dim,
                ],
                center = Center);

        translate([ 0, -Y_Dim - .90, 0 ]) cube([ X_Dim + 2.0, Y_Dim, Z_Dim + 1.0 ], center = true);
    }
}