within ChaoticCircuits.LorenzSystsem;
model IdealCircuit "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=1/3 "height of fluid: try 8/30 for periodic solution";
  //scaling
  parameter Real kx=50 "Scaling factor x";
  parameter Real ky=50 "Scaling factor y";
  parameter Real kz=100 "Scaling factor z";
  parameter SI.Time Tau=1 "Scaling time";
  parameter Real Vs=10 "Limiting supply voltage";
  //basic parameters of components
  parameter SI.Resistance R=10e3 "Output resistance of amplifiers";
  parameter SI.Capacitance C=1e-6 "Capacitor of integrators";
  //parameterization of the opAmp-circuits
  parameter SI.Resistance Rxx =Tau/C/(sigma);
  parameter SI.Resistance Rxy =Tau/C/(sigma*ky/kx);
  parameter SI.Resistance Ryx =Tau/C/(rho*kx/ky);
  parameter SI.Resistance Ryy =Tau/C;
  parameter SI.Resistance Ryxz=Tau/C/(kx*kz/ky*Vs);
  parameter SI.Resistance Rzz =Tau/C/(beta);
  parameter SI.Resistance Rzxy=Tau/C/(kx*ky/kz*Vs);
  //shortcut to results
  Real x=kx*inverter_x.out.v "Result: rate of convection";
  Real y=ky*inverter_y.out.v "Result: horizontal temperature variation";
  Real z=kz*inverter_z.out.v "Result: vertical temperature variation";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_x
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{4,38},{16,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(fixed=true, start=0.001/kx),
      C=C) annotation (Placement(transformation(extent={{10,70},{30,90}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_x
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=R)
    annotation (Placement(transformation(extent={{70,70},{90,90}})));
  Modelica.Electrical.Analog.Basic.Resistor rx1(R=R)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{64,38},{76,50}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_y
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{4,-22},{16,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_y(v(fixed=true, start=0.001/ky),
      C=C) annotation (Placement(transformation(extent={{10,10},{30,30}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_y
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Electrical.Analog.Basic.Resistor ry2(R=R)
    annotation (Placement(transformation(extent={{70,10},{90,30}})));
  Modelica.Electrical.Analog.Basic.Resistor ry1(R=R)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{64,-22},{76,-10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin integrator_z
    annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
  Modelica.Electrical.Analog.Basic.Ground ground5
    annotation (Placement(transformation(extent={{4,-102},{16,-90}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(fixed=true, start=0.001/kz),
      C=C) annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin inverter_z
    annotation (Placement(transformation(extent={{70,-90},{90,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rz2(R=R)
    annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
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
equation
  connect(integrator_x.in_p, ground1.p)
    annotation (Line(points={{10,54},{10,50}}, color={0,0,255}));
  connect(c_x.p, integrator_x.in_n)
    annotation (Line(points={{10,80},{10,66}}, color={0,0,255}));
  connect(c_x.n, integrator_x.out)
    annotation (Line(points={{30,80},{30,60}}, color={0,0,255}));
  connect(rx2.p, inverter_x.in_n)
    annotation (Line(points={{70,80},{70,66}}, color={0,0,255}));
  connect(rx2.n, inverter_x.out)
    annotation (Line(points={{90,80},{90,60}}, color={0,0,255}));
  connect(rx1.n, inverter_x.in_n)
    annotation (Line(points={{60,70},{60,66},{70,66}}, color={0,0,255}));
  connect(integrator_x.out, rx1.p)
    annotation (Line(points={{30,60},{40,60},{40,70}}, color={0,0,255}));
  connect(inverter_x.in_p, ground2.p)
    annotation (Line(points={{70,54},{70,50}}, color={0,0,255}));
  connect(integrator_y.in_p, ground3.p)
    annotation (Line(points={{10,-6},{10,-10}},  color={0,0,255}));
  connect(c_y.p, integrator_y.in_n)
    annotation (Line(points={{10,20},{10,6}}, color={0,0,255}));
  connect(c_y.n, integrator_y.out)
    annotation (Line(points={{30,20},{30,0}},  color={0,0,255}));
  connect(ry2.p, inverter_y.in_n)
    annotation (Line(points={{70,20},{70,6}}, color={0,0,255}));
  connect(ry2.n, inverter_y.out)
    annotation (Line(points={{90,20},{90,0}},  color={0,0,255}));
  connect(ry1.n, inverter_y.in_n)
    annotation (Line(points={{60,10},{60,6},{70,6}},   color={0,0,255}));
  connect(integrator_y.out, ry1.p)
    annotation (Line(points={{30,0},{40,0},{40,10}},     color={0,0,255}));
  connect(inverter_y.in_p, ground4.p)
    annotation (Line(points={{70,-6},{70,-10}},  color={0,0,255}));
  connect(integrator_z.in_p, ground5.p)
    annotation (Line(points={{10,-86},{10,-90}}, color={0,0,255}));
  connect(c_z.p, integrator_z.in_n)
    annotation (Line(points={{10,-60},{10,-74}}, color={0,0,255}));
  connect(c_z.n, integrator_z.out)
    annotation (Line(points={{30,-60},{30,-80}}, color={0,0,255}));
  connect(rz2.p, inverter_z.in_n)
    annotation (Line(points={{70,-60},{70,-74}}, color={0,0,255}));
  connect(rz2.n, inverter_z.out)
    annotation (Line(points={{90,-60},{90,-80}}, color={0,0,255}));
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
  connect(ry2.n, rxy.p) annotation (Line(points={{90,20},{90,40},{-80,40},{-80,60},
          {-20,60}}, color={0,0,255}));
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
  connect(rx2.n, ryx.p) annotation (Line(points={{90,80},{90,100},{-100,100},{
          -100,20},{-20,20}}, color={0,0,255}));
  connect(c_x.n, rxx.p) annotation (Line(points={{30,80},{30,90},{-90,90},{-90,80},
          {-20,80}}, color={0,0,255}));
  connect(c_y.n,ryy. p) annotation (Line(points={{30,20},{30,30},{-70,30},{-70,0},
          {-20,0}}, color={0,0,255}));
  connect(multiplier_xz.out, ryxz.p)
    annotation (Line(points={{-30,-20},{-20,-20}}, color={0,0,255}));
  connect(multiplier_xy.out, rzxy.p)
    annotation (Line(points={{-30,-80},{-20,-80}}, color={0,0,255}));
  connect(c_z.n, rzz.p) annotation (Line(points={{30,-60},{30,-50},{-60,-50},{-60,
          -60},{-20,-60}}, color={0,0,255}));
  connect(rx2.n, multiplier_xz.in1) annotation (Line(points={{90,80},{90,100},
          {-100,100},{-100,-14},{-50,-14}}, color={0,0,255}));
  connect(c_z.n, multiplier_xz.in2) annotation (Line(points={{30,-60},{30,-50},{
          -60,-50},{-60,-26},{-50,-26}}, color={0,0,255}));
  connect(rx2.n, multiplier_xy.in1) annotation (Line(points={{90,80},{90,100},
          {-100,100},{-100,-74},{-50,-74}}, color={0,0,255}));
  connect(ry2.n, multiplier_xy.in2) annotation (Line(points={{90,20},{90,40},{-80,
          40},{-80,-86},{-50,-86}}, color={0,0,255}));
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end IdealCircuit;
