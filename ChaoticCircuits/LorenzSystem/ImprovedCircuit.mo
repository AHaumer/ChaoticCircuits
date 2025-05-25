within ChaoticCircuits.LorenzSystem;
model ImprovedCircuit "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=1/3 "height of fluid: try 8/3 for chaotic solution";
  //scaling
  parameter Real kx=50 "Scaling factor x";
  parameter Real ky=50 "Scaling factor y";
  parameter Real kz=100 "Scaling factor z";
  parameter SI.Time Tau=1 "Scaling time";
  //basic parameters of components
  parameter SI.Voltage Vs=10 "Limiting supply voltage";
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rxx =Tau/C/(sigma);
  parameter SI.Resistance Rxy =Tau/C/(sigma*ky/kx);
  parameter SI.Resistance Ryx =Tau/C/(rho*kx/ky);
  parameter SI.Resistance Ryy =Tau/C;
  parameter SI.Resistance Ryxz=Tau/C/(kx*kz/ky*Vs/unitV);
  parameter SI.Resistance Rzz =Tau/C/(beta);
  parameter SI.Resistance Rzxy=Tau/C/(kx*ky/kz*Vs/unitV);
  //shortcut to results
  Real x=kx*inverter_x.out.v "Result: rate of convection";
  Real y=ky*inverter_y.out.v "Result: horizontal temperature variation";
  Real z=kz*inverter_z.out.v "Result: vertical temperature variation";
  Components.ImprovedOpAmp3Pin integrator_x(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,38},{16,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(fixed=true, start=-0.001/kx),
      C=C) annotation (Placement(transformation(extent={{30,70},{10,90}})));
  Components.ImprovedOpAmp3Pin inverter_x(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=R)
    annotation (Placement(transformation(extent={{90,70},{70,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rx1(R=R)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,38},{76,50}})));
  Components.ImprovedOpAmp3Pin integrator_y(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,-22},{16,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_y(v(fixed=true, start=-0.001/ky),
      C=C) annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Components.ImprovedOpAmp3Pin inverter_y(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Electrical.Analog.Basic.Resistor ry2(R=R)
    annotation (Placement(transformation(extent={{90,10},{70,30}})));
  Modelica.Electrical.Analog.Basic.Resistor ry1(R=R)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,-22},{76,-10}})));
  Components.ImprovedOpAmp3Pin integrator_z(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-102},{16,-90}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(fixed=true, start=-0.001/kz),
      C=C) annotation (Placement(transformation(extent={{30,-70},{10,-50}})));
  Components.ImprovedOpAmp3Pin inverter_z(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{70,-90},{90,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rz2(R=R)
    annotation (Placement(transformation(extent={{90,-70},{70,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rz1(R=R)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Modelica.Electrical.Analog.Basic.Ground ground6
    annotation (Placement(transformation(extent={{64,-102},{76,-90}})));
  Modelica.Electrical.Analog.Basic.Resistor rxx(R=Rxx)
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rxy(R=Rxy)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Modelica.Electrical.Analog.Basic.Resistor ryx(R=Ryx)
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Electrical.Analog.Basic.Resistor ryy(R=Ryy)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Electrical.Analog.Basic.Resistor ryxz(R=Ryxz)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rzz(R=Rzz)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor rzxy(R=Rzxy)
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  Components.Multiplier multiplier_xz(ER=Vs)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  Components.Multiplier multiplier_xy(ER=Vs)
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
protected
  constant SI.Voltage unitV=1;
protected
  //further initialization
  SI.Voltage int_x_v_in(start=0)=integrator_x.v_in.v;
  SI.Voltage int_y_v_in(start=0)=integrator_y.v_in.v;
  SI.Voltage int_z_v_in(start=0)=integrator_z.v_in.v;
  SI.Current inv_z_iOut(start=0)=inverter_z.out.i;
  SI.Current rx2_i(start=0)=rx2.i;
  SI.Current ry2_i(start=0)=ry2.i;
equation
  connect(integrator_x.in_p, ground1.p)
    annotation (Line(points={{10,54},{10,50}}, color={0,0,255}));
  connect(rx1.n, inverter_x.in_n)
    annotation (Line(points={{60,70},{60,66},{70,66}}, color={0,0,255}));
  connect(integrator_x.out, rx1.p)
    annotation (Line(points={{30,60},{40,60},{40,70}}, color={0,0,255}));
  connect(inverter_x.in_p, ground2.p)
    annotation (Line(points={{70,54},{70,50}}, color={0,0,255}));
  connect(integrator_y.in_p, ground3.p)
    annotation (Line(points={{10,-6},{10,-10}},  color={0,0,255}));
  connect(ry1.n, inverter_y.in_n)
    annotation (Line(points={{60,10},{60,6},{70,6}},   color={0,0,255}));
  connect(integrator_y.out, ry1.p)
    annotation (Line(points={{30,0},{40,0},{40,10}},     color={0,0,255}));
  connect(inverter_y.in_p, ground4.p)
    annotation (Line(points={{70,-6},{70,-10}},  color={0,0,255}));
  connect(integrator_z.in_p, ground5.p)
    annotation (Line(points={{10,-86},{10,-90}}, color={0,0,255}));
  connect(rz1.n, inverter_z.in_n)
    annotation (Line(points={{60,-70},{60,-74},{70,-74}}, color={0,0,255}));
  connect(integrator_z.out, rz1.p)
    annotation (Line(points={{30,-80},{40,-80},{40,-70}}, color={0,0,255}));
  connect(inverter_z.in_p, ground6.p)
    annotation (Line(points={{70,-86},{70,-90}}, color={0,0,255}));
  connect(rxy.n, integrator_x.in_n)
    annotation (Line(points={{0,60},{0,66},{10,66}}, color={0,0,255}));
  connect(integrator_x.in_n, rxx.n)
    annotation (Line(points={{10,66},{0,66},{0,80}}, color={0,0,255}));
  connect(ryx.n, integrator_y.in_n)
    annotation (Line(points={{0,20},{0,6},{10,6}}, color={0,0,255}));
  connect(integrator_y.in_n,ryy. n)
    annotation (Line(points={{10,6},{0,6},{0,0}}, color={0,0,255}));
  connect(integrator_y.in_n, ryxz.n)
    annotation (Line(points={{10,6},{0,6},{0,-20}}, color={0,0,255}));
  connect(rzz.n, integrator_z.in_n)
    annotation (Line(points={{0,-60},{0,-74},{10,-74}}, color={0,0,255}));
  connect(integrator_z.in_n, rzxy.n)
    annotation (Line(points={{10,-74},{0,-74},{0,-80}}, color={0,0,255}));
  connect(multiplier_xz.out, ryxz.p)
    annotation (Line(points={{-30,-20},{-20,-20}}, color={0,0,255}));
  connect(multiplier_xy.out, rzxy.p)
    annotation (Line(points={{-30,-80},{-20,-80}}, color={0,0,255}));
  connect(integrator_x.out, c_x.p)
    annotation (Line(points={{30,60},{30,80}}, color={0,0,255}));
  connect(integrator_x.in_n, c_x.n)
    annotation (Line(points={{10,66},{10,80}}, color={0,0,255}));
  connect(c_x.p, rxx.p) annotation (Line(points={{30,80},{30,90},{-90,90},{-90,
          80},{-20,80}}, color={0,0,255}));
  connect(integrator_y.out, c_y.p)
    annotation (Line(points={{30,0},{30,20}}, color={0,0,255}));
  connect(integrator_y.in_n, c_y.n)
    annotation (Line(points={{10,6},{10,20}}, color={0,0,255}));
  connect(c_y.p, ryy.p) annotation (Line(points={{30,20},{30,30},{-70,30},{-70,
          0},{-20,0}}, color={0,0,255}));
  connect(integrator_z.out, c_z.p)
    annotation (Line(points={{30,-80},{30,-60}}, color={0,0,255}));
  connect(integrator_z.in_n, c_z.n)
    annotation (Line(points={{10,-74},{10,-60}}, color={0,0,255}));
  connect(c_z.p, rzz.p) annotation (Line(points={{30,-60},{30,-50},{-60,-50},{
          -60,-60},{-20,-60}}, color={0,0,255}));
  connect(c_z.p, multiplier_xz.in2) annotation (Line(points={{30,-60},{30,-50},
          {-60,-50},{-60,-26},{-50,-26}}, color={0,0,255}));
  connect(inverter_z.out, rz2.p)
    annotation (Line(points={{90,-80},{90,-60}}, color={0,0,255}));
  connect(inverter_z.in_n, rz2.n)
    annotation (Line(points={{70,-74},{70,-60}}, color={0,0,255}));
  connect(inverter_y.out, ry2.p)
    annotation (Line(points={{90,0},{90,20},{90,20}}, color={0,0,255}));
  connect(inverter_y.in_n, ry2.n)
    annotation (Line(points={{70,6},{70,20}}, color={0,0,255}));
  connect(ry2.p, rxy.p) annotation (Line(points={{90,20},{90,40},{-80,40},{-80,
          60},{-20,60}}, color={0,0,255}));
  connect(ry2.p, multiplier_xy.in1) annotation (Line(points={{90,20},{90,40},{
          -80,40},{-80,-74},{-50,-74}}, color={0,0,255}));
  connect(inverter_x.out, rx2.p)
    annotation (Line(points={{90,60},{90,80}}, color={0,0,255}));
  connect(inverter_x.in_n, rx2.n)
    annotation (Line(points={{70,66},{70,80}}, color={0,0,255}));
  connect(rx2.p, ryx.p) annotation (Line(points={{90,80},{90,100},{-100,100},{
          -100,20},{-20,20}}, color={0,0,255}));
  connect(rx2.p, multiplier_xz.in1) annotation (Line(points={{90,80},{90,100},{
          -100,100},{-100,-14},{-50,-14}}, color={0,0,255}));
  connect(rx2.p, multiplier_xy.in2) annotation (Line(points={{90,80},{90,100},{
          -100,100},{-100,-86},{-50,-86}}, color={0,0,255}));
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.LorenzSystem\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{20,-10},{100,-50}},
          textColor={0,0,255},
          textString="beta = 1/3 periodic
beta = 8/3 chaotic"), Line(
          points={{-20,-66},{0,-54}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open}),
        Text(
          extent={{-30,80},{-20,70}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x"),
        Text(
          extent={{-30,70},{-20,60}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y"),
        Text(
          extent={{30,60},{40,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="-x"),
        Text(
          extent={{90,60},{100,50}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-30,20},{-20,10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-30,10},{-20,0}},
          textColor={0,0,0},
          fontSize=10,
          textString="-y"),
        Text(
          extent={{30,0},{40,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="-y"),
        Text(
          extent={{90,0},{100,-10}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y"),
        Text(
          extent={{-60,-26},{-50,-36}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{-60,-4},{-50,-14}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-30,-20},{-20,-30}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z*x"),
        Text(
          extent={{-60,-64},{-50,-74}},
          textColor={0,0,0},
          fontSize=10,
          textString="+y"),
        Text(
          extent={{-60,-86},{-50,-96}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x"),
        Text(
          extent={{-30,-80},{-20,-90}},
          textColor={0,0,0},
          fontSize=10,
          textString="+x*y"),
        Text(
          extent={{-30,-60},{-20,-70}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{30,-80},{40,-90}},
          textColor={0,0,0},
          fontSize=10,
          textString="-z"),
        Text(
          extent={{90,-80},{100,-90}},
          textColor={0,0,0},
          fontSize=10,
          textString="+z")}));
end ImprovedCircuit;
