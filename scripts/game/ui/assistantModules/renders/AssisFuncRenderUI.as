package game.ui.assistantModules.renders
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.CheckBox;
   
   public class AssisFuncRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="262" height="105" buttonMode="true">
			  <Box x="35" y="48" mouseEnabled="false" width="108" height="64" var="box_func" buttonMode="true">
			    <Image skin="png.a5.comps.img_block" x="44" anchorX="0.5" anchorY="0.5" var="img_bg"/>
			    <Label text="商店助手" autoSize="none" y="16" style="渐变4" width="94" height="39" align="center" size="14" var="txt_names" x="-3" multiline="true" wordWrap="true" bold="true"/>
			  </Box>
			  <CheckBox x="10" y="44" selected="false" style="CheckBox普通" var="check_needAuto" buttonMode="true"/>
			  <Label autoSize="none" y="64" height="20" align="left" size="14" var="openTips" x="127" style="不足禁止红"/>
			  <Label text="\l999000751" autoSize="none" y="38" width="130" height="25" align="left" size="14" var="linkGoTo" x="127" isHtml="false" underline="true" mouseChildren="false" style="重要提示黄" buttonMode="true"/>
			  <Label text="\l999000753" autoSize="none" y="91" width="216" align="left" size="12" var="openTips1" x="46" style="普通绿色" multiline="true" wordWrap="true" mouseEnabled="false" mouseChildren="false" height="20"/>
			</View>;
       
      
      public var box_func:Box = null;
      
      public var img_bg:Image = null;
      
      public var txt_names:Label = null;
      
      public var check_needAuto:CheckBox = null;
      
      public var openTips:Label = null;
      
      public var linkGoTo:Label = null;
      
      public var openTips1:Label = null;
      
      public function AssisFuncRenderUI()
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
