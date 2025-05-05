within ChaoticCircuits.RoesslerSystem;
model ScaledBlocks "Roessler system"
  extends Modelica.Icons.Example;
  parameter Real a=0.2 "Coefficient a";
  parameter Real b=0.2 "Coefficient b";
  parameter Real c=1.0 "Coefficient c=5.7 for chaos";
  //scaling
  parameter Real kx=15 "Scaling factor x";
  parameter Real ky=15 "Scaling factor y";
  parameter Real kz=25 "Scaling factor z";
  parameter SI.Time Tau=1 "Scaling time";
  parameter Real Vs=10 "Limiting supply voltage";
  //shortcut to results
  Real x=kx*integrator_x.y "Result x";
  Real y=ky*integrator_y.y "Result y";
  Real z=kz*integrator_z.y "Result z";
  Modelica.Blocks.Math.Add add_x(k1=-ky/kx, k2=-kz/kx)
    annotation (Placement(transformation(extent={{30,50},{50,70}})));
  Modelica.Blocks.Continuous.Integrator integrator_x(k=1/Tau, y_start=0.001/kx)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Math.Add  add_y(k1=kx/ky, k2=a)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Modelica.Blocks.Continuous.Integrator integrator_y(k=1/Tau, y_start=0.001/ky)
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=1/kz,                             k2=-c,
    k3=kx*Vs)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Blocks.Continuous.Integrator integrator_z(k=1/Tau, y_start=0.001/kz)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Blocks.Sources.Constant const(k=b)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Math.MultiProduct product_xz(nu=3)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Modelica.Blocks.Sources.Constant eR(k=1/Vs)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
equation
  connect(add_x.y, integrator_x.u)
    annotation (Line(points={{51,60},{58,60}}, color={0,0,127}));
  connect(add_y.y, integrator_y.u)
    annotation (Line(points={{51,20},{58,20}}, color={0,0,127}));
  connect(integrator_y.y, add_y.u2) annotation (Line(points={{81,20},{90,20},{90,
          40},{-30,40},{-30,14},{28,14}}, color={0,0,127}));
  connect(integrator_y.y, add_x.u1) annotation (Line(points={{81,20},{90,20},{90,
          40},{-30,40},{-30,66},{28,66}}, color={0,0,127}));
  connect(add3_1.y, integrator_z.u)
    annotation (Line(points={{51,-20},{58,-20}}, color={0,0,127}));
  connect(integrator_z.y, add_x.u2) annotation (Line(points={{81,-20},{90,-20},{
          90,0},{-20,0},{-20,54},{28,54}}, color={0,0,127}));
  connect(integrator_x.y, add_y.u1) annotation (Line(points={{81,60},{90,60},{90,
          80},{-40,80},{-40,26},{28,26}}, color={0,0,127}));
  connect(const.y, add3_1.u1) annotation (Line(points={{-59,-10},{-50,-10},{-50,
          -12},{28,-12}}, color={0,0,127}));
  connect(integrator_z.y, add3_1.u2) annotation (Line(points={{81,-20},{90,-20},
          {90,0},{-20,0},{-20,-20},{28,-20}}, color={0,0,127}));
  connect(product_xz.y, add3_1.u3) annotation (Line(points={{11.7,-40},{20,-40},
          {20,-28},{28,-28}}, color={0,0,127}));
  connect(integrator_z.y,product_xz. u[1]) annotation (Line(points={{81,-20},{
          90,-20},{90,0},{-20,0},{-20,-42.3333},{-10,-42.3333}},
                                                              color={0,0,127}));
  connect(eR.y,product_xz. u[2]) annotation (Line(points={{-59,-40},{-34,-40},{-34,
          -40},{-10,-40}}, color={0,0,127}));
  connect(integrator_x.y,product_xz. u[3]) annotation (Line(points={{81,60},{90,
          60},{90,80},{-40,80},{-40,-37.6667},{-10,-37.6667}}, color={0,0,127}));
  annotation (experiment(
      StopTime=1000,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end ScaledBlocks;
