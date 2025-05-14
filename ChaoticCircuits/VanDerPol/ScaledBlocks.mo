within ChaoticCircuits.VanDerPol;
model ScaledBlocks "van der Pol equations"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.2 "Rel. frequency of excitation";
  parameter SI.Frequency f=w*w0/(2*pi) "Excitation voltage frequency";
  //scaling
  parameter Real kx=1 "Scaling factor x";
  parameter Real ky=1 "Scaling factor y";
  parameter Real kz=1 "Scaling factor z";
  parameter SI.AngularVelocity w0=2*pi*1000 "Time scaling = natural angular velocity";
  parameter Real Vs=10 "Limiting supply voltage";
  //initial values
  parameter Real x0=2 "Initial value of x";
  parameter Real y0=-2/15 "Initial value of y";
  parameter Real z0=-5/6 "Initial value of z";
  //shortcut to results
  Real e=excitation.y "Excitation";
  Real x=kx*integrator_x.y "Result: prop. i";
  Real y=ky*add_y.y "Result: prop. der(i)";
  Real z=kz*integrator_z.y "Result: prop. vc";
  Modelica.Blocks.Continuous.Integrator integrator_x(k=w0,    y_start=x0/kx)
    annotation (Placement(transformation(extent={{30,20},{50,40}})));
  Modelica.Blocks.Continuous.Integrator integrator_z(k=w0, y_start=z0/kz)
    annotation (Placement(transformation(extent={{30,60},{50,80}})));
  Modelica.Blocks.Math.Gain gain_x(k=ky/kx)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Constant eR(k=1/Vs)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={80,-20})));
  Modelica.Blocks.Sources.Cosine
                               excitation(amplitude=A, f=f,
    phase=-pi)
    annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  Modelica.Blocks.Math.Gain gain_z(k=kx/kz)
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Math.Add3 add_y(
    k1=-kz/ky,
    k2=1/ky,
    k3=mu*kx*Vs/ky)
    annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
  Modelica.Blocks.Math.MultiProduct multiProduct_x2(nu=3)
    annotation (Placement(transformation(extent={{50,-20},{30,0}})));
  Modelica.Blocks.Math.Add add(k1=-kx^2*Vs/3, k2=1)
    annotation (Placement(transformation(extent={{10,-20},{-10,0}})));
  Modelica.Blocks.Sources.Constant one(k=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-30})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{-30,-20},{-50,0}})));
equation
  connect(gain_x.y, integrator_x.u)
    annotation (Line(points={{21,30},{28,30}}, color={0,0,127}));
  connect(gain_z.y, integrator_z.u)
    annotation (Line(points={{21,70},{28,70}}, color={0,0,127}));
  connect(integrator_x.y, gain_z.u) annotation (Line(points={{51,30},{60,30},{60,
          50},{-10,50},{-10,70},{-2,70}},
                                        color={0,0,127}));
  connect(integrator_z.y, add_y.u1) annotation (Line(points={{51,70},{60,70},{60,
          90},{-40,90},{-40,38},{-32,38}}, color={0,0,127}));
  connect(add_y.y, gain_x.u)
    annotation (Line(points={{-9,30},{-2,30}}, color={0,0,127}));
  connect(excitation.y, add_y.u2)
    annotation (Line(points={{-69,30},{-32,30}}, color={0,0,127}));
  connect(multiProduct_x2.y, add.u1) annotation (Line(points={{28.3,-10},{20,-10},
          {20,-4},{12,-4}}, color={0,0,127}));
  connect(add.u2, one.y)
    annotation (Line(points={{12,-16},{20,-16},{20,-19}}, color={0,0,127}));
  connect(eR.y, multiProduct.u[1]) annotation (Line(points={{69,-20},{60,-20},{
          60,-50},{-20,-50},{-20,-12.3333},{-30,-12.3333}},
                                             color={0,0,127}));
  connect(add.y, multiProduct.u[2]) annotation (Line(points={{-11,-10},{-30,-10}},
                           color={0,0,127}));
  connect(integrator_x.y, multiProduct.u[3]) annotation (Line(points={{51,30},{60,
          30},{60,10},{-20,10},{-20,-7.66667},{-30,-7.66667}},
                                                           color={0,0,127}));
  connect(multiProduct.y, add_y.u3) annotation (Line(points={{-51.7,-10},{-60,-10},
          {-60,22},{-32,22}}, color={0,0,127}));
  connect(eR.y, multiProduct_x2.u[1]) annotation (Line(points={{69,-20},{60,-20},
          {60,-12.3333},{50,-12.3333}}, color={0,0,127}));
  connect(integrator_x.y, multiProduct_x2.u[2]) annotation (Line(points={{51,30},
          {60,30},{60,-10},{50,-10}}, color={0,0,127}));
  connect(integrator_x.y, multiProduct_x2.u[3]) annotation (Line(points={{51,30},
          {60,30},{60,-7.66667},{50,-7.66667}}, color={0,0,127}));
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
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.VanDerPol\">enclosing subpackage</a>.</p>
</html>"));
end ScaledBlocks;
