within ChaoticCircuits.RoesslerSystem;
model IdealCircuit "Roessler system"
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
  //basic parameters of components
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rxy =Tau/C/(ky/kx);
  parameter SI.Resistance Rxz =Tau/C/(kz/kx);
  parameter SI.Resistance Ryx =Tau/C/(kx/ky);
  parameter SI.Resistance Ryy =Tau/C/(a);
  parameter SI.Resistance Rzz =Tau/C/(c);
  parameter SI.Resistance Rzb =Tau/C/(1/kz);
  parameter SI.Resistance Rzxz=Tau/C/(kx*Vs);
  //shortcut to results
  Real x=kx*inverter_x.out.v "Result x";
  Real y=ky*inverter_y.out.v "Result y";
  Real z=kz*inverter_z.out.v "Result z";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,38},{16,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(fixed=true, start=-0.001/kx),
      C=C) annotation (Placement(transformation(extent={{30,70},{10,90}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_x
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=R)
    annotation (Placement(transformation(extent={{90,70},{70,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rx1(R=R)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,38},{76,50}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_y
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,-22},{16,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_y(v(fixed=true, start=-0.001/ky),
      C=C) annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_y
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Electrical.Analog.Basic.Resistor ry2(R=R)
    annotation (Placement(transformation(extent={{90,10},{70,30}})));
  Modelica.Electrical.Analog.Basic.Resistor ry1(R=R)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,-22},{76,-10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_z
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-82},{16,-70}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(fixed=true, start=-0.001/kz),
      C=C) annotation (Placement(transformation(extent={{30,-50},{10,-30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_z
    annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rz2(R=R)
    annotation (Placement(transformation(extent={{90,-50},{70,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rz1(R=R)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{64,-82},{76,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rxy(R=Rxy)
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rxz(R=Rxz)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Modelica.Electrical.Analog.Basic.Resistor ryx(R=Ryx)
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Electrical.Analog.Basic.Resistor ryy(R=Ryy)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Electrical.Analog.Basic.Resistor rzz(R=Rzz)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rzb(R=Rzb)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rzxz(R=Rzxz)
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  Components.Multiplier multiplier_xz(ER=Vs)
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage vb(V=b) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-60})));
  Modelica.Electrical.Analog.Basic.Ground ground7
    annotation (Placement(transformation(extent={{-86,-90},{-74,-78}})));
equation
  connect(integrator_x.in_p,ground1. p)
    annotation (Line(points={{10,54},{10,50}}, color={0,0,255}));
  connect(rx1.n,inverter_x. in_n)
    annotation (Line(points={{60,70},{60,66},{70,66}}, color={0,0,255}));
  connect(integrator_x.out,rx1. p)
    annotation (Line(points={{30,60},{40,60},{40,70}}, color={0,0,255}));
  connect(inverter_x.in_p,ground2. p)
    annotation (Line(points={{70,54},{70,50}}, color={0,0,255}));
  connect(integrator_y.in_p,ground3. p)
    annotation (Line(points={{10,-6},{10,-10}},  color={0,0,255}));
  connect(ry1.n,inverter_y. in_n)
    annotation (Line(points={{60,10},{60,6},{70,6}},   color={0,0,255}));
  connect(integrator_y.out,ry1. p)
    annotation (Line(points={{30,0},{40,0},{40,10}},     color={0,0,255}));
  connect(inverter_y.in_p,ground4. p)
    annotation (Line(points={{70,-6},{70,-10}},  color={0,0,255}));
  connect(integrator_z.in_p,ground5. p)
    annotation (Line(points={{10,-66},{10,-70}}, color={0,0,255}));
  connect(rz1.n,inverter_z. in_n)
    annotation (Line(points={{60,-50},{60,-54},{70,-54}}, color={0,0,255}));
  connect(integrator_z.out,rz1. p)
    annotation (Line(points={{30,-60},{40,-60},{40,-50}}, color={0,0,255}));
  connect(inverter_z.in_p,ground6. p)
    annotation (Line(points={{70,-66},{70,-70}}, color={0,0,255}));
  connect(rxz.n, integrator_x.in_n)
    annotation (Line(points={{0,60},{0,66},{10,66}}, color={0,0,255}));
  connect(rxy.n, integrator_x.in_n)
    annotation (Line(points={{0,80},{0,66},{10,66}}, color={0,0,255}));
  connect(ryy.n, integrator_y.in_n)
    annotation (Line(points={{0,0},{0,6},{10,6}}, color={0,0,255}));
  connect(ryx.n, integrator_y.in_n)
    annotation (Line(points={{0,20},{0,6},{10,6}}, color={0,0,255}));
  connect(rzb.n, integrator_z.in_n)
    annotation (Line(points={{0,-60},{0,-54},{10,-54}}, color={0,0,255}));
  connect(rzxz.n, rzb.n)
    annotation (Line(points={{0,-80},{0,-60}}, color={0,0,255}));
  connect(rzz.n, integrator_z.in_n)
    annotation (Line(points={{0,-40},{0,-54},{10,-54}}, color={0,0,255}));
  connect(multiplier_xz.out, rzxz.p)
    annotation (Line(points={{-30,-80},{-20,-80}}, color={0,0,255}));
  connect(vb.n, ground7.p)
    annotation (Line(points={{-80,-70},{-80,-78}}, color={0,0,255}));
  connect(vb.p, rzb.p)
    annotation (Line(points={{-80,-50},{-20,-50},{-20,-60}}, color={0,0,255}));
  connect(integrator_x.out, c_x.p)
    annotation (Line(points={{30,60},{30,80},{30,80}}, color={0,0,255}));
  connect(integrator_x.in_n, c_x.n)
    annotation (Line(points={{10,66},{10,80}}, color={0,0,255}));
  connect(integrator_y.out, c_y.p)
    annotation (Line(points={{30,0},{30,20}}, color={0,0,255}));
  connect(integrator_y.in_n, c_y.n)
    annotation (Line(points={{10,6},{10,20}}, color={0,0,255}));
  connect(integrator_z.out, c_z.p)
    annotation (Line(points={{30,-60},{30,-40}}, color={0,0,255}));
  connect(integrator_z.in_n, c_z.n)
    annotation (Line(points={{10,-54},{10,-40}}, color={0,0,255}));
  connect(c_z.p, rzz.p) annotation (Line(points={{30,-40},{30,-30},{-50,-30},{-50,
          -40},{-20,-40}}, color={0,0,255}));
  connect(c_z.p, rxz.p) annotation (Line(points={{30,-40},{30,-30},{-50,-30},{-50,
          60},{-20,60}}, color={0,0,255}));
  connect(c_y.p, rxy.p) annotation (Line(points={{30,20},{30,30},{-70,30},{-70,80},
          {-20,80}}, color={0,0,255}));
  connect(inverter_x.in_n, rx2.n)
    annotation (Line(points={{70,66},{70,80}}, color={0,0,255}));
  connect(inverter_x.out, rx2.p)
    annotation (Line(points={{90,60},{90,80}}, color={0,0,255}));
  connect(rx2.p, multiplier_xz.in2) annotation (Line(points={{90,80},{90,100},{-100,
          100},{-100,-86},{-50,-86}}, color={0,0,255}));
  connect(rx2.p, ryx.p) annotation (Line(points={{90,80},{90,100},{-100,100},{-100,
          20},{-20,20}}, color={0,0,255}));
  connect(inverter_y.out, ry2.p)
    annotation (Line(points={{90,0},{90,20}}, color={0,0,255}));
  connect(inverter_y.in_n, ry2.n)
    annotation (Line(points={{70,6},{70,20}}, color={0,0,255}));
  connect(ry2.p, ryy.p) annotation (Line(points={{90,20},{90,40},{-80,40},{-80,0},
          {-20,0}}, color={0,0,255}));
  connect(inverter_z.out, rz2.p)
    annotation (Line(points={{90,-60},{90,-40}}, color={0,0,255}));
  connect(inverter_z.in_n, rz2.n)
    annotation (Line(points={{70,-54},{70,-40}}, color={0,0,255}));
  connect(rz2.p, multiplier_xz.in1) annotation (Line(points={{90,-40},{90,-20},{
          -60,-20},{-60,-74},{-50,-74}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1000,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{0,-80},{100,-100}},
          textColor={0,0,255},
          textString="c = 1.0 periodic
c = 5.7 chaotic"),    Line(
          points={{-20,-46},{0,-34}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open}),
        Text(
          extent={{90,60},{100,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{90,0},{100,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y"),
        Text(
          extent={{30,60},{40,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x"),
        Text(
          extent={{30,0},{40,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="-y"),
        Text(
          extent={{90,-60},{100,-70}},
          textColor={0,0,0},
          fontSize=10,
          textString="+z"),
        Text(
          extent={{30,-60},{40,-70}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{-60,-86},{-50,-96}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-60,-64},{-50,-74}},
          textColor={0,0,0},
          fontSize=10,
          textString="+z"),
        Text(
          extent={{-30,-80},{-20,-90}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x*z"),
        Text(
          extent={{-30,-50},{-20,-60}},
          textColor={0,0,0},
          fontSize=10,
          textString="+b"),
        Text(
          extent={{-30,-30},{-20,-40}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{-30,10},{-20,0}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y"),
        Text(
          extent={{-30,20},{-20,10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-30,70},{-20,60}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{-30,80},{-20,70}},
          textColor={0,0,0},
          fontSize=10,
          textString="-y")}));
end IdealCircuit;
