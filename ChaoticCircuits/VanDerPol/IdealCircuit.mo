within ChaoticCircuits.VanDerPol;
model IdealCircuit "van der Pol equations"
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
  //basic parameters of components
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rzx =1/(w0*C)/(kx/kz);
  parameter SI.Resistance Rxy =1/(w0*C)/(ky/kx);
  parameter SI.Resistance Ryz =R/(kz/ky);
  parameter SI.Resistance Rye =R/(1/ky);
  parameter SI.Resistance Ryx2=R/(mu*kx/ky*Vs);
  parameter SI.Resistance Rx2 =R/(kx^2*Vs/3);
  //shortcut to results
  Real e=-excitation.v "Excitation";
  Real x=-kx*integrator_x.out.v "Result: prop. i";
  Real y=ky*add_y.out.v "Result: prop. der(i)";
  Real z=kz*integrator_z.out.v "Result: prop. vc";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_z
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{44,38},{56,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(fixed=true, start=z0/kz),  C
      =C) annotation (Placement(transformation(extent={{70,70},{50,90}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{44,-22},{56,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(fixed=true, start=-x0/kx),
      C=C) annotation (Placement(transformation(extent={{70,10},{50,30}})));
  Modelica.Electrical.Analog.Basic.Resistor rzx(R=Rzx)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin add_y
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Resistor ryb(R=R)
    annotation (Placement(transformation(extent={{10,10},{-10,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{-16,-22},{-4,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rxy(R=Rxy)
    annotation (Placement(transformation(extent={{40,0},{20,20}})));
  Modelica.Electrical.Analog.Basic.Resistor ryz(R=Ryz)
    annotation (Placement(transformation(extent={{-20,0},{-40,20}})));
  Modelica.Electrical.Analog.Basic.Resistor rye(R=Rye)
    annotation (Placement(transformation(extent={{-20,20},{-40,40}})));
  Modelica.Electrical.Analog.Basic.Resistor ryx2(R=Ryx2)
    annotation (Placement(transformation(extent={{-20,-20},{-40,0}})));
  Components.Multiplier multiplier_x2(ER=Vs)
    annotation (Placement(transformation(extent={{70,-50},{50,-30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin add_1x2
    annotation (Placement(transformation(extent={{10,-70},{-10,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor r1x2(R=R)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-82},{16,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=Rx2)
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  Components.Multiplier multiplier(ER=Vs)
    annotation (Placement(transformation(extent={{-30,-60},{-50,-40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=-1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-70})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R)
    annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
  Modelica.Electrical.Analog.Sources.CosineVoltage excitation(
    V=A,
    phase=0.0174532925199433*(-180 + 180),
    f=f) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,50})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{-16,38},{-4,50}})));
equation
  connect(integrator_z.in_p,ground1. p)
    annotation (Line(points={{50,54},{50,50}}, color={0,0,255}));
  connect(integrator_x.in_p,ground3. p)
    annotation (Line(points={{50,-6},{50,-10}},  color={0,0,255}));
  connect(rzx.n,integrator_z. in_n)
    annotation (Line(points={{40,70},{40,66},{50,66}},
                                                     color={0,0,255}));
  connect(integrator_z.out, c_z.p)
    annotation (Line(points={{70,60},{70,80}}, color={0,0,255}));
  connect(integrator_z.in_n, c_z.n)
    annotation (Line(points={{50,66},{50,80}}, color={0,0,255}));
  connect(integrator_x.out,c_x. p)
    annotation (Line(points={{70,0},{70,20}}, color={0,0,255}));
  connect(integrator_x.in_n,c_x. n)
    annotation (Line(points={{50,6},{50,20}}, color={0,0,255}));
  connect(ryb.p, add_y.out)
    annotation (Line(points={{10,20},{10,0}},    color={0,0,255}));
  connect(add_y.in_n, ryb.n)
    annotation (Line(points={{-10,6},{-10,20}},  color={0,0,255}));
  connect(add_y.out, rxy.n)
    annotation (Line(points={{10,0},{20,0},{20,10}},      color={0,0,255}));
  connect(rxy.p, integrator_x.in_n)
    annotation (Line(points={{40,10},{40,6},{50,6}}, color={0,0,255}));
  connect(add_y.in_p, ground2.p)
    annotation (Line(points={{-10,-6},{-10,-10}},
                                               color={0,0,255}));
  connect(rye.p, add_y.in_n)
    annotation (Line(points={{-20,30},{-20,6},{-10,6}},   color={0,0,255}));
  connect(add_y.in_n, ryx2.p)
    annotation (Line(points={{-10,6},{-20,6},{-20,-10}}, color={0,0,255}));
  connect(add_y.in_n, ryz.p)
    annotation (Line(points={{-10,6},{-20,6},{-20,10}},   color={0,0,255}));
  connect(r1x2.p, add_1x2.out)
    annotation (Line(points={{-10,-40},{-10,-60}}, color={0,0,255}));
  connect(r1x2.n, add_1x2.in_n)
    annotation (Line(points={{10,-40},{10,-54}},   color={0,0,255}));
  connect(add_1x2.in_p, ground5.p)
    annotation (Line(points={{10,-66},{10,-70}},   color={0,0,255}));
  connect(rx2.p, add_1x2.in_n)
    annotation (Line(points={{20,-40},{20,-54},{10,-54}},    color={0,0,255}));
  connect(add_1x2.out, multiplier.in2) annotation (Line(points={{-10,-60},{-20,-60},
          {-20,-56},{-30,-56}}, color={0,0,255}));
  connect(multiplier_x2.out, rx2.n)
    annotation (Line(points={{50,-40},{40,-40}},color={0,0,255}));
  connect(add_1x2.in_n, r1.p)
    annotation (Line(points={{10,-54},{20,-54},{20,-60}},    color={0,0,255}));
  connect(r1.n, constantVoltage.p)
    annotation (Line(points={{40,-60},{50,-60}},color={0,0,255}));
  connect(constantVoltage.n, ground5.p) annotation (Line(points={{50,-80},{20,-80},
          {20,-70},{10,-70}},   color={0,0,255}));
  connect(excitation.n, ground6.p)
    annotation (Line(points={{-20,50},{-10,50}}, color={0,0,255}));
  connect(multiplier.out, ryx2.n) annotation (Line(points={{-50,-50},{-60,-50},{
          -60,-10},{-40,-10}},
                             color={0,0,255}));
  connect(excitation.p, rye.n)
    annotation (Line(points={{-40,50},{-40,30}}, color={0,0,255}));
  connect(integrator_z.out, ryz.n) annotation (Line(points={{70,60},{80,60},{80,
          90},{-60,90},{-60,10},{-40,10}},     color={0,0,255}));
  connect(integrator_x.out, multiplier_x2.in1) annotation (Line(points={{70,0},{
          80,0},{80,-34},{70,-34}}, color={0,0,255}));
  connect(integrator_x.out, multiplier_x2.in2) annotation (Line(points={{70,0},{
          80,0},{80,-46},{70,-46}}, color={0,0,255}));
  connect(integrator_x.out, multiplier.in1) annotation (Line(points={{70,0},{80,
          0},{80,-20},{-20,-20},{-20,-44},{-30,-44}}, color={0,0,255}));
  connect(integrator_x.out, rzx.p) annotation (Line(points={{70,0},{80,0},{80,40},
          {10,40},{10,70},{20,70}}, color={0,0,255}));
  annotation (experiment(
      StopTime=0.2,
      Interval=0.2e-5,
      Tolerance=1e-06),
  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
                      Text(
          extent={{-90,-60},{-10,-100}},
          textColor={0,0,255},
          textString="A = 0 autononmous
A = 0.45 chaotic
A = 1.00 periodic",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{70,60},{80,50}},
          textColor={0,0,0},
          textString="+z",
          fontSize=10),
        Text(
          extent={{70,0},{80,-10}},
          textColor={0,0,0},
          textString="-x",
          fontSize=10),
        Text(
          extent={{40,-30},{50,-40}},
          textColor={0,0,0},
          textString="x^2",
          fontSize=10),
        Text(
          extent={{20,-70},{30,-80}},
          textColor={0,0,0},
          textString="-1",
          fontSize=10),
        Text(
          extent={{-20,-60},{-10,-70}},
          textColor={0,0,0},
          textString="1-x^2",
          fontSize=10),
        Text(
          extent={{-60,-20},{-40,-30}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x*(1-x^2)"),
        Text(
          extent={{-60,20},{-50,10}},
          textColor={0,0,0},
          textString="+z",
          fontSize=10),
        Text(
          extent={{-50,40},{-40,30}},
          textColor={0,0,0},
          fontSize=10,
          textString="-e"),
        Text(
          extent={{10,0},{20,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y")}),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end IdealCircuit;
