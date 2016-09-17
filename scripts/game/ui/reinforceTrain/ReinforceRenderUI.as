package game.ui.reinforceTrain
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.Box;
   
   public class ReinforceRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="148" height="230">
			  <Image skin="png.comp.image" x="2" y="3" width="143" height="203" var="img_head"/>
			  <Image skin="png.uiReinforceTrain.img_b2" x="2" y="3" var="img_bord"/>
			  <Label text="\l30815016" autoSize="none" x="5" y="170" style="普通说明" width="136" height="20" align="center" var="txt_name"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="1" y="194" var="progress_lev" width="145" height="15"/>
			  <Label text="\l30815016" autoSize="none" x="4" y="212" style="普通说明" width="136" height="20" align="center" var="txt_lev"/>
			  <Image skin="png.uiReinforceTrain.加号" x="64" y="66" var="img_plus" mouseEnabled="false" width="22" height="22"/>
			  <Label text="25级开启" autoSize="none" y="69" style="渐变2" width="120" wordWrap="true" align="center" var="txt_openLvl" isHtml="true" mouseEnabled="false" size="12" height="69" centerX="0" multiline="true" x="14"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="59" y="23" var="img_lock" buttonMode="false" mouseEnabled="false"/>
			  <Label text="\l30815016" autoSize="none" x="4" y="119" style="渐变2" width="136" height="40" align="center" var="txt_hint" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true"/>
			  <Box x="-2" y="-1" var="img_label">
			    <Image skin="png.uiReinforceTrain.img_reinforce"/>
			    <Label y="15" style="渐变2" width="53" height="20" rotation="-16" mouseEnabled="false" mouseChildren="false" size="12" var="tipTxt" x="9"/>
			  </Box>
			</View>;
       
      
      public var img_head:Image = null;
      
      public var img_bord:Image = null;
      
      public var txt_name:Label = null;
      
      public var progress_lev:ProgressBar = null;
      
      public var txt_lev:Label = null;
      
      public var img_plus:Image = null;
      
      public var txt_openLvl:Label = null;
      
      public var img_lock:Image = null;
      
      public var txt_hint:Label = null;
      
      public var img_label:Box = null;
      
      public var tipTxt:Label = null;
      
      public function ReinforceRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
