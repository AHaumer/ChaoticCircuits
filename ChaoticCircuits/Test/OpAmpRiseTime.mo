within ChaoticCircuits.Test;
model OpAmpRiseTime "Measure Rise time of OpAmp"
  extends Modelica.Icons.Example;
  import Modelica.Utilities.Streams.print;
  parameter SI.Voltage Vstep=10 "Height of input step";
  parameter SI.Time Tr=1e-3 "Rise time (unrealistic low for test)";
  parameter SI.Time Tau=opAmp.V0/log(9)*Tr "firstOrder time constant";
  discrete SI.Time t10(start=0) "Time when output exceeds 10%";
  discrete SI.Time t90(start=0) "Time when output exceeds 90%";
  Components.ImprovedOpAmp3Pin opAmp(useFirstOrder=true, Tau=Tau)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sources.StepVoltage v_in(
    V=Vstep,
    offset=0,
    startTime=0.001)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-20})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={20,-20})));
equation
  when vOut.v>=0.10*Vstep then
    t10=time;
  end when;
  when vOut.v>=0.90*Vstep then
    t90=time;
  end when;
  when terminal() then
    print("Tr=" + String(t90 - t10));
  end when;
  connect(v_in.p, opAmp.in_p)
    annotation (Line(points={{-20,-10},{-20,-6},{-10,-6}}, color={0,0,255}));
  connect(v_in.n, ground.p)
    annotation (Line(points={{-20,-30},{0,-30}}, color={0,0,255}));
  connect(ground.p, vOut.n)
    annotation (Line(points={{0,-30},{20,-30}}, color={0,0,255}));
  connect(vOut.p, opAmp.out)
    annotation (Line(points={{20,-10},{20,0},{10,0}}, color={0,0,255}));
  connect(opAmp.out, opAmp.in_n) annotation (Line(points={{10,0},{20,0},{20,20},
          {-20,20},{-20,6},{-10,6}}, color={0,0,255}));
  annotation (experiment(
      StopTime=0.005,
      Interval=1e-07,
      Tolerance=1e-06));
end OpAmpRiseTime;
