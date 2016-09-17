package game.ui.reinforceTrain
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class ReinforceLevViewUI extends View
   {
      
      protected static var uiView:XML = <View width="922" height="431">
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="-3" y="1" width="925" height="430" sizeGrid="20,20,20,20"/>
			  <Image skin="png.comp.image" x="2" y="4" width="920" height="422" var="img_bg0"/>
			  <Image skin="png.comp.image" x="-4" y="179" width="925" height="252" var="img_bg1"/>
			  <Image skin="png.uiReinforceTrain.img_bg2" x="253" y="238"/>
			  <List x="10" y="6" var="list_hero" repeatX="6" spaceX="5">
			    <ReinforceRender name="render" runtime="game.ui.reinforceTrain.ReinforceRenderUI"/>
			  </List>
			  <Label text="渐变1" autoSize="none" x="91" y="250" style="渐变1" width="740" height="27" align="center" var="txt_title" centerX="0"/>
			  <Image skin="png.uiReinforceTrain.img_arrow" x="442" y="318"/>
			  <Box x="259" y="280" var="box_left">
			    <Label text="二级框标题" autoSize="none" style="二级框标题" width="170" height="20" align="center" var="txt_name0" x="-2" y="0"/>
			    <Label text="技能名标题" autoSize="none" y="20" style="技能名标题" align="center" width="170" height="20" var="txt_tip0" x="-2"/>
			    <List y="37" repeatX="1" repeatY="5" spaceX="-4" spaceY="-1" var="list_propBase0" x="6">
			      <ReinforcePropRender name="render" runtime="game.ui.reinforceTrain.ReinforcePropRenderUI"/>
			    </List>
			  </Box>
			  <Box x="497" y="280">
			    <Label text="二级框标题" autoSize="none" style="二级框标题" width="170" height="20" align="center" var="txt_name1"/>
			    <Label text="技能名标题" autoSize="none" y="20" style="技能名标题" align="center" width="170" height="20" var="txt_tip1"/>
			    <List y="37" repeatX="1" repeatY="5" spaceX="-4" spaceY="-1" var="list_propBase1" x="7">
			      <ReinforcePropRender name="render" runtime="game.ui.reinforceTrain.ReinforcePropRenderUI"/>
			    </List>
			  </Box>
			  <Label text="上阵援军满5个才能达到援军之力的激活条件！" autoSize="none" x="262" y="327" style="普通说明" width="160" height="37" multiline="true" wordWrap="true" var="txt_level0"/>
			  <Label text="上阵援军满5个才能达到援军之力的激活条件！" autoSize="none" x="515" y="327" style="普通说明" width="160" height="37" multiline="true" wordWrap="true" var="txt_level1"/>
			</View>;
       
      
      public var img_bg0:Image = null;
      
      public var img_bg1:Image = null;
      
      public var list_hero:List = null;
      
      public var txt_title:Label = null;
      
      public var box_left:Box = null;
      
      public var txt_name0:Label = null;
      
      public var txt_tip0:Label = null;
      
      public var list_propBase0:List = null;
      
      public var txt_name1:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var list_propBase1:List = null;
      
      public var txt_level0:Label = null;
      
      public var txt_level1:Label = null;
      
      public function ReinforceLevViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.reinforceTrain.ReinforcePropRenderUI"] = ReinforcePropRenderUI;
         viewClassMap["game.ui.reinforceTrain.ReinforceRenderUI"] = ReinforceRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
