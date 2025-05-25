within ChaoticCircuits.RikitakeSystem;
model ImprovedCircuit "Rikitake system"
  extends Modelica.Icons.Example;
  extends Modelica.Icons.UnderConstruction;
  parameter Real mu=0.4 "Resistive parameter";
  parameter Real D =2 "Speed difference";
  parameter SI.Time tRef=0.030 "Reference for sclaing time";
  //basic parameters of components
  parameter SI.Voltage Vs=10 "Limiting supply voltage";
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  //shortcut to results
  Real x1(start=0.001, fixed=true)=inverter_x1.out.v "Current 1";
  Real x2(start=0.001, fixed=true)=inverter_x2.out.v "Current 2";
  Real z(start=1, fixed=true)=inverter_z.out.v "Speed";
  Components.ImprovedOpAmp3Pin integrator_x1(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x1(v(start=-0.001),
      C=C) annotation (Placement(transformation(extent={{30,70},{10,90}})));
  Components.ImprovedOpAmp3Pin inverter_x1(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx12(R=R)
    annotation (Placement(transformation(extent={{90,70},{70,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rx11(R=R)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,38},{76,50}})));
  Components.ImprovedOpAmp3Pin integrator_x2(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x2(v(start=-0.001),
      C=C) annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Components.ImprovedOpAmp3Pin inverter_x2(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Electrical.Analog.Basic.Resistor rx22(R=R)
    annotation (Placement(transformation(extent={{90,10},{70,30}})));
  Modelica.Electrical.Analog.Basic.Resistor rx21(R=R)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,-22},{76,-10}})));
  Components.ImprovedOpAmp3Pin integrator_z(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(start=1),             C=C)
           annotation (Placement(transformation(extent={{30,-50},{10,-30}})));
  Components.ImprovedOpAmp3Pin inverter_z(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rz2(R=R)
    annotation (Placement(transformation(extent={{90,-50},{70,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rz1(R=R)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{64,-82},{76,-70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,38},{16,50}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,-22},{16,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-82},{16,-70}})));
  Components.Multiplier multiplier_x2z(ER=Vs)
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Components.Multiplier multiplier_x1z_D(ER=Vs)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Components.Multiplier multiplier_x1x2(ER=Vs)
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage one(V=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,-50})));
  Modelica.Electrical.Analog.Basic.Ground ground7
    annotation (Placement(transformation(extent={{-96,-80},{-84,-68}})));
equation
  connect(rx11.n, inverter_x1.in_n)
    annotation (Line(points={{60,70},{60,66},{70,66}}, color={0,0,255}));
  connect(integrator_x1.out, rx11.p)
    annotation (Line(points={{30,60},{40,60},{40,70}}, color={0,0,255}));
  connect(inverter_x1.in_p, ground2.p)
    annotation (Line(points={{70,54},{70,50}}, color={0,0,255}));
  connect(rx21.n, inverter_x2.in_n)
    annotation (Line(points={{60,10},{60,6},{70,6}}, color={0,0,255}));
  connect(integrator_x2.out, rx21.p)
    annotation (Line(points={{30,0},{40,0},{40,10}}, color={0,0,255}));
  connect(inverter_x2.in_p, ground4.p)
    annotation (Line(points={{70,-6},{70,-10}}, color={0,0,255}));
  connect(rz1.n,inverter_z. in_n)
    annotation (Line(points={{60,-50},{60,-54},{70,-54}}, color={0,0,255}));
  connect(integrator_z.out,rz1. p)
    annotation (Line(points={{30,-60},{40,-60},{40,-50}}, color={0,0,255}));
  connect(inverter_z.in_p,ground6. p)
    annotation (Line(points={{70,-66},{70,-70}}, color={0,0,255}));
  connect(inverter_x1.in_n, rx12.n)
    annotation (Line(points={{70,66},{70,80}}, color={0,0,255}));
  connect(inverter_x1.out, rx12.p)
    annotation (Line(points={{90,60},{90,80}}, color={0,0,255}));
  connect(inverter_x2.out, rx22.p)
    annotation (Line(points={{90,0},{90,20}}, color={0,0,255}));
  connect(inverter_x2.in_n, rx22.n)
    annotation (Line(points={{70,6},{70,20}}, color={0,0,255}));
  connect(inverter_z.out,rz2. p)
    annotation (Line(points={{90,-60},{90,-40}}, color={0,0,255}));
  connect(inverter_z.in_n,rz2. n)
    annotation (Line(points={{70,-54},{70,-40}}, color={0,0,255}));
  connect(c_x1.p, integrator_x1.out)
    annotation (Line(points={{30,80},{30,60}}, color={0,0,255}));
  connect(c_x1.n, integrator_x1.in_n)
    annotation (Line(points={{10,80},{10,66}}, color={0,0,255}));
  connect(c_x2.n, integrator_x2.in_n)
    annotation (Line(points={{10,20},{10,6}}, color={0,0,255}));
  connect(c_x2.p, integrator_x2.out)
    annotation (Line(points={{30,20},{30,0}}, color={0,0,255}));
  connect(c_z.n, integrator_z.in_n)
    annotation (Line(points={{10,-40},{10,-54}}, color={0,0,255}));
  connect(c_z.p, integrator_z.out)
    annotation (Line(points={{30,-40},{30,-60}}, color={0,0,255}));
  connect(integrator_x1.in_p, ground1.p)
    annotation (Line(points={{10,54},{10,50}}, color={0,0,255}));
  connect(integrator_x2.in_p, ground3.p)
    annotation (Line(points={{10,-6},{10,-10}}, color={0,0,255}));
  connect(integrator_z.in_p, ground5.p)
    annotation (Line(points={{10,-66},{10,-70}}, color={0,0,255}));
  connect(one.n, ground7.p)
    annotation (Line(points={{-90,-60},{-90,-68}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.0005,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.RikitakeSystem\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,-80},{80,-100}},
          textColor={0,0,255},
          textString="Path to chaos: mu={0.4, 0.6, 0.8}"),
        Text(
          extent={{90,60},{100,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x1"),
        Text(
          extent={{30,60},{40,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x1"),
        Text(
          extent={{30,0},{40,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x2"),
        Text(
          extent={{90,0},{100,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x2"),
        Text(
          extent={{30,-60},{40,-70}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{90,-60},{100,-70}},
          textColor={0,0,0},
          fontSize=10,
          textString="+z")}));
end ImprovedCircuit;
