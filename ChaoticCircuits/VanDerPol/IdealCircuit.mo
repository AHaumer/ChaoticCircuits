within ChaoticCircuits.VanDerPol;
model IdealCircuit "van der Pol equations"
  extends Modelica.Icons.Example;
  extends Modelica.Icons.UnderConstruction;
  import Modelica.Constants.pi;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.2 "Frequency of excitation";
  //scaling
  parameter Real kx=1 "Scaling factor x";
  parameter Real ky=1 "Scaling factor y";
  parameter SI.Time Tau=1000 "Time scaling";
  parameter Real Vs=10 "Limiting supply voltage";
  //basic parameters of components
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rxy   =Tau/C/(ky/kx);
  parameter SI.Resistance Ryx   =Tau/C/(kx/ky);
  parameter SI.Resistance R1    =Tau/C/(kx/ky);
  parameter SI.Resistance Rx2   =Tau/C/(kx/ky);
  parameter SI.Resistance Rye   =Tau/C/(kx/ky);
  parameter SI.Resistance Ry1x2y=Tau/C/(kx/ky);
  //initial values
  parameter Real x0=2 "Initial values of x";
  parameter Real y0=0 "Initial values of y";
  //shortcut to results
  Real x=kx*inverter_x.out.v "Result: prop. i";
  Real y=ky*inverter_y.out.v "Result: prop. der(i)";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x
    annotation (Placement(transformation(extent={{10,10},{30,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,-2},{16,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(fixed=true, start=-0.001/kx),
      C=C) annotation (Placement(transformation(extent={{30,30},{10,50}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_x
    annotation (Placement(transformation(extent={{70,10},{90,30}})));
  Modelica.Electrical.Analog.Basic.Resistor rxb(R=R)
    annotation (Placement(transformation(extent={{90,30},{70,50}})));
  Modelica.Electrical.Analog.Basic.Resistor rxa(R=R)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,-2},{76,10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_y
    annotation (Placement(transformation(extent={{10,-50},{30,-30}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,-62},{16,-50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_y(v(fixed=true, start=-0.001/ky),
      C=C) annotation (Placement(transformation(extent={{30,-30},{10,-10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_y
    annotation (Placement(transformation(extent={{70,-50},{90,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor ryb(R=R)
    annotation (Placement(transformation(extent={{90,-30},{70,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rya(R=R)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,-62},{76,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rxy(R=Rxy)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Electrical.Analog.Basic.Resistor ryx(R=Ryx)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Components.Multiplier multiplier_x2(ER=Vs)
    annotation (Placement(transformation(extent={{20,80},{0,60}})));
  Modelica.Electrical.Analog.Sources.SineVoltage excitation(V=A, f=w/(2*pi)*Tau)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-70})));
  Modelica.Electrical.Analog.Basic.Ground grounde
    annotation (Placement(transformation(extent={{-66,-100},{-54,-88}})));
  Modelica.Electrical.Analog.Basic.Resistor ry1x2y(R=Ry1x2y)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rye(R=Rye)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch
    annotation (Placement(transformation(extent={{-50,-50},{-30,-70}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=A > 0)
    annotation (Placement(transformation(extent={{-12,-88},{-28,-72}})));
  Components.Multiplier multiplier_1x2y(ER=Vs)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=Rx2)
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  Modelica.Electrical.Analog.Basic.Resistor rx4(R=R)
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin add_1x2
    annotation (Placement(transformation(extent={{-60,60},{-80,80}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{-66,48},{-54,60}})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1)
    annotation (Placement(transformation(extent={{-50,80},{-30,100}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage one(V=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,90})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{4,78},{16,90}})));
equation
  connect(integrator_x.in_p,ground1. p)
    annotation (Line(points={{10,14},{10,10}}, color={0,0,255}));
  connect(rxa.n,inverter_x. in_n)
    annotation (Line(points={{60,30},{60,26},{70,26}}, color={0,0,255}));
  connect(integrator_x.out,rxa. p)
    annotation (Line(points={{30,20},{40,20},{40,30}}, color={0,0,255}));
  connect(inverter_x.in_p,ground2. p)
    annotation (Line(points={{70,14},{70,10}}, color={0,0,255}));
  connect(integrator_y.in_p,ground3. p)
    annotation (Line(points={{10,-46},{10,-50}}, color={0,0,255}));
  connect(rya.n,inverter_y. in_n)
    annotation (Line(points={{60,-30},{60,-34},{70,-34}},
                                                       color={0,0,255}));
  connect(integrator_y.out,rya. p)
    annotation (Line(points={{30,-40},{40,-40},{40,-30}},color={0,0,255}));
  connect(inverter_y.in_p,ground4. p)
    annotation (Line(points={{70,-46},{70,-50}}, color={0,0,255}));
  connect(integrator_x.out,c_x. p)
    annotation (Line(points={{30,20},{30,40}}, color={0,0,255}));
  connect(integrator_x.in_n,c_x. n)
    annotation (Line(points={{10,26},{10,40}}, color={0,0,255}));
  connect(integrator_y.out,c_y. p)
    annotation (Line(points={{30,-40},{30,-20}},
                                              color={0,0,255}));
  connect(integrator_y.in_n,c_y. n)
    annotation (Line(points={{10,-34},{10,-20}},
                                              color={0,0,255}));
  connect(inverter_y.out,ryb. p)
    annotation (Line(points={{90,-40},{90,-20}},      color={0,0,255}));
  connect(inverter_y.in_n,ryb. n)
    annotation (Line(points={{70,-34},{70,-20}},
                                              color={0,0,255}));
  connect(inverter_x.out,rxb. p)
    annotation (Line(points={{90,20},{90,40}}, color={0,0,255}));
  connect(inverter_x.in_n,rxb. n)
    annotation (Line(points={{70,26},{70,40}}, color={0,0,255}));
  connect(rxy.n, integrator_x.in_n)
    annotation (Line(points={{0,30},{0,26},{10,26}}, color={0,0,255}));
  connect(ryb.p, rxy.p) annotation (Line(points={{90,-20},{90,0},{-60,0},{-60,30},
          {-20,30}},     color={0,0,255}));
  connect(ryx.n, integrator_y.in_n)
    annotation (Line(points={{0,-20},{0,-34},{10,-34}}, color={0,0,255}));
  connect(c_x.p, ryx.p) annotation (Line(points={{30,40},{30,50},{-70,50},{-70,-20},
          {-20,-20}}, color={0,0,255}));
  connect(excitation.n, grounde.p)
    annotation (Line(points={{-60,-80},{-60,-88}}, color={0,0,255}));
  connect(integrator_y.in_n, ry1x2y.n)
    annotation (Line(points={{10,-34},{0,-34},{0,-40}}, color={0,0,255}));
  connect(integrator_y.in_n, rye.n)
    annotation (Line(points={{10,-34},{0,-34},{0,-60}}, color={0,0,255}));
  connect(excitation.p, switch.p)
    annotation (Line(points={{-60,-60},{-50,-60}}, color={0,0,255}));
  connect(switch.n, rye.p)
    annotation (Line(points={{-30,-60},{-20,-60}}, color={0,0,255}));
  connect(booleanConstant.y, switch.control) annotation (Line(points={{-28.8,-80},
          {-40,-80},{-40,-72}}, color={255,0,255}));
  connect(multiplier_1x2y.out, ry1x2y.p)
    annotation (Line(points={{-30,-40},{-20,-40}}, color={0,0,255}));
  connect(add_1x2.out, rx4.p)
    annotation (Line(points={{-80,70},{-80,90}}, color={0,0,255}));
  connect(add_1x2.in_n, rx4.n)
    annotation (Line(points={{-60,76},{-60,90}}, color={0,0,255}));
  connect(add_1x2.in_n, rx2.p)
    annotation (Line(points={{-60,76},{-50,76},{-50,70}}, color={0,0,255}));
  connect(add_1x2.in_n, r1.p)
    annotation (Line(points={{-60,76},{-50,76},{-50,90}}, color={0,0,255}));
  connect(multiplier_x2.out, rx2.n)
    annotation (Line(points={{0,70},{-30,70}},  color={0,0,255}));
  connect(add_1x2.in_p, ground5.p)
    annotation (Line(points={{-60,64},{-60,60}}, color={0,0,255}));
  connect(ground6.p, one.n)
    annotation (Line(points={{10,90},{0,90}}, color={0,0,255}));
  connect(one.p, r1.n)
    annotation (Line(points={{-20,90},{-30,90}}, color={0,0,255}));
  connect(multiplier_1x2y.in2, add_1x2.out)
    annotation (Line(points={{-50,-46},{-80,-46},{-80,70}}, color={0,0,255}));
  connect(rya.p, multiplier_1x2y.in1) annotation (Line(points={{40,-30},{40,-8},
          {-60,-8},{-60,-34},{-50,-34}}, color={0,0,255}));
  connect(c_x.p, multiplier_x2.in1)
    annotation (Line(points={{30,40},{30,64},{20,64}}, color={0,0,255}));
  connect(rxb.p, multiplier_x2.in2)
    annotation (Line(points={{90,40},{90,76},{20,76}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
                      Text(
          extent={{0,-60},{100,-100}},
          textColor={0,0,255},
          textString="A = 0 autononmous
A = 0.45 chaotic
A = 1.00 periodic",
          horizontalAlignment=TextAlignment.Left)}),
    experiment(
      StopTime=1,
      Interval=1e-5,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end IdealCircuit;
