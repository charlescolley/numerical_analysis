%Charlie Colley
%Xiaozhe Hu
%Numerical Analysis midterm
%problem 3e

Poly1 = [-2,-1,2,1];
Poly2 = [-.104,1.5993,-6.45,9.02,-5.1,1];
Poly3 = [1,-2,0,0,-1,2];

Poly1_root1 = Speed_Poly_roots(Poly1,3,10^-3,50);
Poly1_root2 = Speed_Poly_roots(Poly1,0,10^-3,50);
Poly1_root3= Speed_Poly_roots(Poly1,-.7,10^-3,50);

Poly2_root1 = Speed_Poly_roots(Poly2,0,10^-6,50);
Poly2_root2 = Speed_Poly_roots(Poly2,.22,10^-6,50);
Poly2_root3 = Speed_Poly_roots(Poly2,1,10^-6,50);
Poly2_root4 = Speed_Poly_roots(Poly2,1.5,10^-6,50);
Poly2_root5 = Speed_Poly_roots(Poly2,2,10^-6,50);

Poly3_root1 = Speed_Poly_roots(Poly3,2,10^-3,50);
Poly3_root2 = Speed_Poly_roots(Poly3,0,10^-3,50);
Poly3_root3 = Speed_Poly_roots(Poly3,-.5,10^-3,50);
Poly3_root4 = Speed_Poly_roots(Poly3,,10^-3,50);
Poly3_root5 = Speed_Poly_roots(Poly3,0,10^-3,50);
