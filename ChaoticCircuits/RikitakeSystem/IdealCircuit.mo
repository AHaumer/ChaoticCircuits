within ChaoticCircuits.RikitakeSystem;
model IdealCircuit "Rikitake system"
  extends Modelica.Icons.Example;
  parameter Real mu=0.4 "Resistive parameter";
  parameter Real D =2 "Speed difference";
  parameter SI.Time Tau=0.030 "Reference for sclaing time";
  //basic parameters of components
  parameter SI.Voltage Vs=10 "Limiting supply voltage";
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rx1x1=Tau/C/mu;
  parameter SI.Resistance Rx1x2z=Tau/C/(Vs/unitV);
  parameter SI.Resistance Rx2x2=Tau/C/mu;
  parameter SI.Resistance Rx2x1z=Tau/C/(Vs/unitV);
  parameter SI.Resistance RzOne=Tau/C;
  parameter SI.Resistance Rzx1x2=Tau/C/(Vs/unitV);
  //shortcut to results
  Real x1(start=0.001, fixed=true)=inverter_x1.out.v/unitV "Current 1";
  Real x2(start=0.001, fixed=true)=inverter_x2.out.v/unitV "Current 2";
  Real z(start=1, fixed=true)=inverter_z.out.v/unitV "Speed";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x1
    annotation (Placement(transformation(extent={{10,90},{30,110}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x1(v(start=-0.001), C=C)
    annotation (Placement(transformation(extent={{30,110},{10,130}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_x1
    annotation (Placement(transformation(extent={{70,90},{90,110}})));
  Modelica.Electrical.Analog.Basic.Resistor rx12(R=R)
    annotation (Placement(transformation(extent={{90,110},{70,130}})));
  Modelica.Electrical.Analog.Basic.Resistor rx11(R=R)
    annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,78},{76,90}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x2
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x2(v(start=-0.001), C=C)
    annotation (Placement(transformation(extent={{30,50},{10,70}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_x2
    annotation (Placement(transformation(extent={{70,30},{90,50}})));
  Modelica.Electrical.Analog.Basic.Resistor rx22(R=R)
    annotation (Placement(transformation(extent={{90,50},{70,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx21(R=R)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,18},{76,30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_z
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(start=-1),C=C)
           annotation (Placement(transformation(extent={{30,-20},{10,0}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_z
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor rz2(R=R)
    annotation (Placement(transformation(extent={{90,-20},{70,0}})));
  Modelica.Electrical.Analog.Basic.Resistor rz1(R=R)
    annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{64,-52},{76,-40}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,78},{16,90}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,18},{16,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-52},{16,-40}})));
  Components.Multiplier multiplier_x2z(ER=Vs)
    annotation (Placement(transformation(extent={{-50,90},{-30,110}})));
  Components.Multiplier multiplier_x1z(ER=Vs)
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  Components.Multiplier multiplier_x1x2(ER=Vs)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage const_D(V=D)  annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-130,-70})));
  Modelica.Electrical.Analog.Basic.Ground ground7
    annotation (Placement(transformation(extent={{-136,-98},{-124,-86}})));
  Modelica.Electrical.Analog.Basic.Resistor rx1x1(R=Rx1x1)
    annotation (Placement(transformation(extent={{-20,110},{0,130}})));
  Modelica.Electrical.Analog.Basic.Resistor rx1x2z(R=Rx1x2z)
    annotation (Placement(transformation(extent={{-20,90},{0,110}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2x2(R=Rx2x2)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2x1z(R=Rx2x1z)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Electrical.Analog.Basic.Resistor rz4z(R=R)
    annotation (Placement(transformation(extent={{-120,-50},{-100,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor rz4(R=R)
    annotation (Placement(transformation(extent={{-70,-50},{-90,-30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin adder_z_D
    annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rz4D(R=R)
    annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
  Modelica.Electrical.Analog.Basic.Ground ground8
    annotation (Placement(transformation(extent={{-96,-84},{-84,-72}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage one(V=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-32,-50})));
  Modelica.Electrical.Analog.Basic.Ground ground9
    annotation (Placement(transformation(extent={{-38,-78},{-26,-66}})));
  Modelica.Electrical.Analog.Basic.Resistor rzOne(R=RzOne)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor rzx1x2(R=Rzx1x2)
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
protected
  constant SI.Voltage unitV=1;
equation
  connect(rx11.n, inverter_x1.in_n)
    annotation (Line(points={{60,110},{60,106},{70,106}},
                                                       color={0,0,255}));
  connect(integrator_x1.out, rx11.p)
    annotation (Line(points={{30,100},{40,100},{40,110}},
                                                       color={0,0,255}));
  connect(inverter_x1.in_p, ground2.p)
    annotation (Line(points={{70,94},{70,90}}, color={0,0,255}));
  connect(rx21.n, inverter_x2.in_n)
    annotation (Line(points={{60,50},{60,46},{70,46}},
                                                     color={0,0,255}));
  connect(integrator_x2.out, rx21.p)
    annotation (Line(points={{30,40},{40,40},{40,50}},
                                                     color={0,0,255}));
  connect(inverter_x2.in_p, ground4.p)
    annotation (Line(points={{70,34},{70,30}},  color={0,0,255}));
  connect(rz1.n,inverter_z. in_n)
    annotation (Line(points={{60,-20},{60,-24},{70,-24}}, color={0,0,255}));
  connect(integrator_z.out,rz1. p)
    annotation (Line(points={{30,-30},{40,-30},{40,-20}}, color={0,0,255}));
  connect(inverter_z.in_p,ground6. p)
    annotation (Line(points={{70,-36},{70,-40}}, color={0,0,255}));
  connect(inverter_x1.in_n, rx12.n)
    annotation (Line(points={{70,106},{70,120}},
                                               color={0,0,255}));
  connect(inverter_x1.out, rx12.p)
    annotation (Line(points={{90,100},{90,120}},
                                               color={0,0,255}));
  connect(inverter_x2.out, rx22.p)
    annotation (Line(points={{90,40},{90,60}},color={0,0,255}));
  connect(inverter_x2.in_n, rx22.n)
    annotation (Line(points={{70,46},{70,60}},color={0,0,255}));
  connect(inverter_z.out,rz2. p)
    annotation (Line(points={{90,-30},{90,-10}}, color={0,0,255}));
  connect(inverter_z.in_n,rz2. n)
    annotation (Line(points={{70,-24},{70,-10}}, color={0,0,255}));
  connect(c_x1.p, integrator_x1.out)
    annotation (Line(points={{30,120},{30,100}},
                                               color={0,0,255}));
  connect(c_x1.n, integrator_x1.in_n)
    annotation (Line(points={{10,120},{10,106}},
                                               color={0,0,255}));
  connect(c_x2.n, integrator_x2.in_n)
    annotation (Line(points={{10,60},{10,46}},color={0,0,255}));
  connect(c_x2.p, integrator_x2.out)
    annotation (Line(points={{30,60},{30,40}},color={0,0,255}));
  connect(c_z.n, integrator_z.in_n)
    annotation (Line(points={{10,-10},{10,-24}}, color={0,0,255}));
  connect(c_z.p, integrator_z.out)
    annotation (Line(points={{30,-10},{30,-30}}, color={0,0,255}));
  connect(integrator_x1.in_p, ground1.p)
    annotation (Line(points={{10,94},{10,90}}, color={0,0,255}));
  connect(integrator_x2.in_p, ground3.p)
    annotation (Line(points={{10,34},{10,30}},  color={0,0,255}));
  connect(integrator_z.in_p, ground5.p)
    annotation (Line(points={{10,-36},{10,-40}}, color={0,0,255}));
  connect(const_D.n, ground7.p)
    annotation (Line(points={{-130,-80},{-130,-86}}, color={0,0,255}));
  connect(rz2.p, multiplier_x2z.in2) annotation (Line(points={{90,-10},{90,20},{
          -100,20},{-100,94},{-50,94}}, color={0,0,255}));
  connect(multiplier_x2z.out, rx1x2z.p)
    annotation (Line(points={{-30,100},{-20,100}},
                                                 color={0,0,255}));
  connect(rx1x2z.n, integrator_x1.in_n)
    annotation (Line(points={{0,100},{0,106},{10,106}},
                                                     color={0,0,255}));
  connect(integrator_x1.in_n, rx1x1.n)
    annotation (Line(points={{10,106},{0,106},{0,120}}, color={0,0,255}));
  connect(c_x1.p, rx1x1.p) annotation (Line(points={{30,120},{30,130},{-30,130},
          {-30,120},{-20,120}}, color={0,0,255}));
  connect(c_x2.p, rx2x2.p) annotation (Line(points={{30,60},{30,70},{-20,70},{-20,
          60}}, color={0,0,255}));
  connect(rx2x2.n, integrator_x2.in_n)
    annotation (Line(points={{0,60},{0,46},{10,46}}, color={0,0,255}));
  connect(multiplier_x1z.out, rx2x1z.p)
    annotation (Line(points={{-30,40},{-20,40}}, color={0,0,255}));
  connect(integrator_x2.in_n, rx2x1z.n)
    annotation (Line(points={{10,46},{0,46},{0,40}}, color={0,0,255}));
  connect(rx12.p, multiplier_x1z.in1) annotation (Line(points={{90,120},{90,140},
          {-140,140},{-140,46},{-50,46}}, color={0,0,255}));
  connect(rx22.p, multiplier_x2z.in1) annotation (Line(points={{90,60},{90,80},{
          -120,80},{-120,106},{-50,106}}, color={0,0,255}));
  connect(rz4.p, adder_z_D.out)
    annotation (Line(points={{-70,-40},{-70,-60}}, color={0,0,255}));
  connect(const_D.p, rz4D.p)
    annotation (Line(points={{-130,-60},{-120,-60}}, color={0,0,255}));
  connect(rz4D.n, adder_z_D.in_n) annotation (Line(points={{-100,-60},{-100,-54},
          {-90,-54}}, color={0,0,255}));
  connect(adder_z_D.in_n, rz4.n)
    annotation (Line(points={{-90,-54},{-90,-40}}, color={0,0,255}));
  connect(adder_z_D.in_n, rz4z.n) annotation (Line(points={{-90,-54},{-100,-54},
          {-100,-40}}, color={0,0,255}));
  connect(adder_z_D.in_p, ground8.p)
    annotation (Line(points={{-90,-66},{-90,-72}}, color={0,0,255}));
  connect(adder_z_D.out, multiplier_x1z.in2) annotation (Line(points={{-70,-60},
          {-60,-60},{-60,34},{-50,34}}, color={0,0,255}));
  connect(rx12.p, multiplier_x1x2.in1) annotation (Line(points={{90,120},{90,140},
          {-140,140},{-140,-4},{-50,-4}},
                                        color={0,0,255}));
  connect(c_x2.p, multiplier_x1x2.in2) annotation (Line(points={{30,60},{30,70},
          {-110,70},{-110,-16},{-50,-16}},
                                         color={0,0,255}));
  connect(one.n, ground9.p)
    annotation (Line(points={{-32,-60},{-32,-66}}, color={0,0,255}));
  connect(one.p, rzOne.p)
    annotation (Line(points={{-32,-40},{-32,-30},{-20,-30}}, color={0,0,255}));
  connect(rzOne.n, integrator_z.in_n)
    annotation (Line(points={{0,-30},{0,-24},{10,-24}}, color={0,0,255}));
  connect(integrator_z.in_n, rzx1x2.n)
    annotation (Line(points={{10,-24},{0,-24},{0,-10}}, color={0,0,255}));
  connect(rzx1x2.p, multiplier_x1x2.out)
    annotation (Line(points={{-20,-10},{-30,-10}}, color={0,0,255}));
  connect(c_z.p, rz4z.p) annotation (Line(points={{30,-10},{30,12},{-90,12},{-90,
          -28},{-120,-28},{-120,-40}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.0005,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.RikitakeSystem\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(coordinateSystem(extent={{-140,-100},{100,140}}),
            graphics={Text(
          extent={{-80,-80},{80,-100}},
          textColor={0,0,255},
          textString="Path to chaos: mu={0.4, 0.6, 0.8}"),
        Text(
          extent={{90,102},{100,92}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x1"),
        Text(
          extent={{30,100},{40,90}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x1"),
        Text(
          extent={{30,40},{40,30}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x2"),
        Text(
          extent={{90,40},{100,30}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x2"),
        Text(
          extent={{30,-30},{40,-40}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{90,-30},{100,-40}},
          textColor={0,0,0},
          fontSize=10,
          textString="+z")}),
    Icon(coordinateSystem(extent={{-140,-100},{100,140}})));
end IdealCircuit;
