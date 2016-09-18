package game.ui.npcFuncLists
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   
   public class NpcFuncListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="90">
			  <Box x="4" var="box1" y="-30">
			    <Image skin="png.uiNpcFuncLists.玩法框" x="4" y="38" var="img_bg"/>
			    <RedPointNum x="301" y="33" var="redPoiUI" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			    <Image skin="png.a5.comps.img_block" x="7" y="109" width="143" height="132" var="img_icon" autoSize="true" anchorY="1"/>
			    <GRect fillAlpha="0.5" radius="6,6,6,6" lineAlpha="0" x="6" var="img_icon_mask" width="106" height="108"/>
			    <Label text="渐变1" autoSize="none" x="115" y="50" style="渐变1" width="186" height="23" align="right" var="txt_title" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="普通说明" x="85" y="81" style="普通说明" width="227" align="right" var="txt_content" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true" height="40" language="en" lgx="85,85" lgy="77,76"/>
			    <Image skin="png.uiNpcFuncLists.锁链" y="67" var="img_lock" x="0"/>
			    <Image skin="png.a5.comps.img_block" x="101" y="44" var="img_multiple" autoSize="true"/>
			  </Box>
			  <Label text="报错了" x="34" y="22" style="不足禁止红" width="212" height="36" align="center" var="txt_alert" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var box1:Box = null;
      
      public var img_bg:Image = null;
      
      public var redPoiUI:RedPointNumUI = null;
      
      public var img_icon:Image = null;
      
      public var img_icon_mask:GRect = null;
      
      public var txt_title:Label = null;
      
      public var txt_content:Label = null;
      
      public var img_lock:Image = null;
      
      public var img_multiple:Image = null;
      
      public var txt_alert:Label = null;
      
      public function NpcFuncListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
