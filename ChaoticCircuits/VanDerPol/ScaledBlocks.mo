within ChaoticCircuits.VanDerPol;
model ScaledBlocks "van der Pol equations"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.2 "Frequency of excitation";
  //scaling
  parameter Real kx=1 "Scaling factor x";
  parameter Real ky=1 "Scaling factor y";
  parameter Real kt=2*pi*1000 "Time scaling";
  parameter Real Vs=10 "Limiting supply voltage";
  //initial values
  parameter Real x0=2 "Initial value of x";
  parameter Real y0=-1/7.5 "Initial value of y";
  //shortcut to results
  Real e=excitation.y "Excitation";
  Real x=kx*integrator_x.y "Result: prop. i";
  Real y=ky*integrator_y.y "Result: prop. der(i)";
  Modelica.Blocks.Continuous.Integrator integrator_x(k=kt,    y_start=x0/kx)
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Continuous.Integrator integrator_y(k=kt,    y_start=y0/ky)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Gain gain_x(k=ky/kx)
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  Modelica.Blocks.Math.Add3 add_y(
    k1=-kx/ky,
    k2=mu*kx^2*Vs^2,
    k3=1/ky) annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Math.MultiProduct product_x2(nu=3)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Sources.Constant eR(k=1/Vs)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-30})));
  Modelica.Blocks.Math.Add add_x2(k1=1/(kx^2*Vs),
                                                k2=-1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,20})));
  Modelica.Blocks.Sources.Constant one(k=1)
    annotation (Placement(transformation(extent={{-20,30},{-40,50}})));
  Modelica.Blocks.Math.MultiProduct product_x2y(nu=3)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Sine excitation(amplitude=A, f=w/(2*pi)*kt)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
equation
  connect(gain_x.y, integrator_x.u)
    annotation (Line(points={{51,40},{58,40}}, color={0,0,127}));
  connect(integrator_y.y, gain_x.u) annotation (Line(points={{81,0},{90,0},{90,
          20},{20,20},{20,40},{28,40}}, color={0,0,127}));
  connect(add_y.y, integrator_y.u)
    annotation (Line(points={{51,0},{58,0}}, color={0,0,127}));
  connect(integrator_x.y, add_y.u1) annotation (Line(points={{81,40},{90,40},{
          90,60},{10,60},{10,8},{28,8}}, color={0,0,127}));
  connect(integrator_x.y, product_x2.u[1]) annotation (Line(points={{81,40},{90,
          40},{90,60},{-92,60},{-92,37.6667},{-80,37.6667}}, color={0,0,127}));
  connect(eR.y, product_x2.u[2])
    annotation (Line(points={{-90,-19},{-90,40},{-80,40}}, color={0,0,127}));
  connect(integrator_x.y, product_x2.u[3]) annotation (Line(points={{81,40},{90,
          40},{90,60},{-92,60},{-92,42.3333},{-80,42.3333}}, color={0,0,127}));
  connect(product_x2y.y, add_y.u2)
    annotation (Line(points={{1.7,0},{28,0}}, color={0,0,127}));
  connect(eR.y, product_x2y.u[1]) annotation (Line(points={{-90,-19},{-90,-10},
          {-30,-10},{-30,-2.33333},{-20,-2.33333}}, color={0,0,127}));
  connect(add_x2.y, product_x2y.u[2])
    annotation (Line(points={{-50,9},{-50,0},{-20,0}}, color={0,0,127}));
  connect(integrator_y.y, product_x2y.u[3]) annotation (Line(points={{81,0},{90,
          0},{90,20},{-30,20},{-30,2.33333},{-20,2.33333}}, color={0,0,127}));
  connect(excitation.y, add_y.u3) annotation (Line(points={{1,-40},{20,-40},{20,
          -8},{28,-8}}, color={0,0,127}));
  connect(one.y, add_x2.u1)
    annotation (Line(points={{-41,40},{-44,40},{-44,32}}, color={0,0,127}));
  connect(product_x2.y, add_x2.u2)
    annotation (Line(points={{-58.3,40},{-56,40},{-56,32}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
                      Text(
          extent={{-80,-60},{20,-100}},
          textColor={0,0,255},
          textString="A = 0 autononmous
A = 0.45 chaotic
A = 1.00 periodic",
          horizontalAlignment=TextAlignment.Left)}),
    experiment(
      StopTime=0.2,
      Interval=0.2e-5,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end ScaledBlocks;
