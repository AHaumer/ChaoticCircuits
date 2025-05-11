within ChaoticCircuits.LorenzSystem;
model ScaledBlocks "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=1/3 "height of fluid: try 8/3 for chaotic solution";
  //scaling
  parameter Real kx=50 "Scaling factor x";
  parameter Real ky=50 "Scaling factor y";
  parameter Real kz=100 "Scaling factor z";
  parameter SI.Time Tau=1 "Scaling time";
  parameter SI.Voltage Vs=10 "Limiting supply voltage";
  //shortcut to results
  Real x=kx*integrator_x.y "Result: rate of convection";
  Real y=ky*integrator_y.y "Result: horizontal temperature variation";
  Real z=kz*integrator_z.y "Result: vertical temperature variation";
  Modelica.Blocks.Continuous.Integrator integrator_x(k=1/Tau, y_start=0.001/kx)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Continuous.Integrator integrator_y(k=1/Tau, y_start=0.001/ky)
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Continuous.Integrator integrator_z(k=1/Tau, y_start=0.001/kz)
    annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
  Modelica.Blocks.Math.Add add_x(k1=-sigma, k2=sigma*ky/kx)
    annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Blocks.Math.Add3 add_y(
    k1=rho*kx/ky,
    k2=-1,
    k3=-kx*kz/ky*Vs/unitV)
    annotation (Placement(transformation(extent={{10,10},{30,30}})));
  Modelica.Blocks.Math.Add add_z(k1=-beta, k2=kx*ky/kz*Vs/unitV)
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Blocks.Math.MultiProduct product_xz(nu=3)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.Constant eR(k=unitV/Vs)
    annotation (Placement(transformation(extent={{10,-30},{-10,-10}})));
  Modelica.Blocks.Math.MultiProduct product_xy(nu=3)
    annotation (Placement(transformation(extent={{-30,-90},{-10,-70}})));
protected
  constant SI.Voltage unitV=1;
equation
  connect(add_x.y, integrator_x.u)
    annotation (Line(points={{31,70},{38,70}}, color={0,0,127}));
  connect(add_y.y, integrator_y.u)
    annotation (Line(points={{31,20},{38,20}},
                                             color={0,0,127}));
  connect(add_z.y, integrator_z.u)
    annotation (Line(points={{31,-60},{38,-60}}, color={0,0,127}));
  connect(integrator_x.y, add_x.u1) annotation (Line(points={{61,70},{70,70},{
          70,90},{-80,90},{-80,76},{8,76}},  color={0,0,127}));
  connect(integrator_y.y, add_x.u2) annotation (Line(points={{61,20},{70,20},{
          70,40},{-70,40},{-70,64},{8,64}},  color={0,0,127}));
  connect(integrator_x.y, add_y.u1) annotation (Line(points={{61,70},{70,70},{
          70,90},{-80,90},{-80,28},{8,28}},  color={0,0,127}));
  connect(integrator_y.y, add_y.u2) annotation (Line(points={{61,20},{70,20},{
          70,40},{-70,40},{-70,20},{8,20}},  color={0,0,127}));
  connect(product_xz.y, add_y.u3)
    annotation (Line(points={{-8.3,0},{0,0},{0,12},{8,12}}, color={0,0,127}));
  connect(eR.y, product_xz.u[1]) annotation (Line(points={{-11,-20},{-40,-20},{
          -40,-2.33333},{-30,-2.33333}}, color={0,0,127}));
  connect(integrator_z.y, product_xz.u[2]) annotation (Line(points={{61,-60},{70,
          -60},{70,-40},{-60,-40},{-60,0},{-30,0}},    color={0,0,127}));
  connect(integrator_x.y, product_xz.u[3]) annotation (Line(points={{61,70},{70,
          70},{70,90},{-80,90},{-80,2.33333},{-30,2.33333}}, color={0,0,127}));
  connect(product_xy.y, add_z.u2) annotation (Line(points={{-8.3,-80},{0,-80},{
          0,-66},{8,-66}}, color={0,0,127}));
  connect(integrator_z.y, add_z.u1) annotation (Line(points={{61,-60},{70,-60},{
          70,-40},{-60,-40},{-60,-54},{8,-54}},   color={0,0,127}));
  connect(integrator_x.y, product_xy.u[1]) annotation (Line(points={{61,70},{70,
          70},{70,90},{-80,90},{-80,-82.3333},{-30,-82.3333}}, color={0,0,127}));
  connect(integrator_y.y, product_xy.u[2]) annotation (Line(points={{61,20},{70,
          20},{70,40},{-70,40},{-70,-80},{-30,-80}}, color={0,0,127}));
  connect(eR.y, product_xy.u[3]) annotation (Line(points={{-11,-20},{-40,-20},{
          -40,-77.6667},{-30,-77.6667}}, color={0,0,127}));
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{20,0},{100,-40}},
          textColor={0,0,255},
          textString="beta = 1/3 periodic
beta = 8/3 chaotic")}));
end ScaledBlocks;
