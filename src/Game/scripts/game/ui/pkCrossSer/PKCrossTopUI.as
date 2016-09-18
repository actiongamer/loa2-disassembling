package game.ui.pkCrossSer
{
   import morn.core.components.View;
   import morn.core.components.ProgressBar;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Label;
   
   public class PKCrossTopUI extends View
   {
      
      protected static var uiView:XML = <View width="510" height="100">
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="9" y="49" sizeGrid="5,0,12,0" width="478" var="progressBar"/>
			  <TreasureBoxBaseRender x="94" y="8" var="box0" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="188" y="8" var="box1" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="278" y="8" var="box2" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="370" y="8" var="box3" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="464" y="8" var="box4" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <Label text="普通说明" autoSize="none" x="85" y="65" style="普通说明" var="txt_0"/>
			  <Label text="普通说明" autoSize="none" x="175" y="65" style="普通说明" var="txt_1"/>
			  <Label text="普通说明" autoSize="none" x="267" y="65" style="普通说明" var="txt_2"/>
			  <Label text="普通说明" autoSize="none" x="359" y="65" style="普通说明" var="txt_3"/>
			  <Label text="普通说明" autoSize="none" x="453" y="65" style="普通说明" var="txt_4"/>
			  <Label text="\l50600012" autoSize="none" x="-134" y="29" style="普通说明" width="215" height="24" align="right"/>
			  <Label text="\l999001128" autoSize="none" x="-134" y="9" style="下划线黄色" width="215" height="24" align="right"/>
			</View>;
       
      
      public var progressBar:ProgressBar = null;
      
      public var box0:TreasureBoxBaseRenderUI = null;
      
      public var box1:TreasureBoxBaseRenderUI = null;
      
      public var box2:TreasureBoxBaseRenderUI = null;
      
      public var box3:TreasureBoxBaseRenderUI = null;
      
      public var box4:TreasureBoxBaseRenderUI = null;
      
      public var txt_0:Label = null;
      
      public var txt_1:Label = null;
      
      public var txt_2:Label = null;
      
      public var txt_3:Label = null;
      
      public var txt_4:Label = null;
      
      public function PKCrossTopUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
