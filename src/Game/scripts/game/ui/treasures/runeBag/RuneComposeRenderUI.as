package game.ui.treasures.runeBag
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class RuneComposeRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="54" height="110">
			  <Label text="突破时" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="-19" y="-28" width="92" height="18" align="center" style="普通说明" mouseChildren="false"/>
			  <Box x="-3" y="8" var="itemBox">
			    <Label text="\l30600218" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" align="left" y="66" width="65" height="16" style="普通说明" language="en" lgx="-5,7" lgy="66,66" x="-5"/>
			    <Label text="\l30600203" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" align="left" y="93" width="36" height="16" style="普通说明" language="en" lgx="-5,7" lgy="84,84"/>
			    <Box x="5">
			      <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			      <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56" smoothing="true"/>
			    </Box>
			    <Label text="3" stroke="0xffffff" mouseEnabled="false" var="txt_need" backgroundColor="0xcfbeaf" autoSize="none" align="left" x="45" y="67" width="19" height="16" style="普通绿色" language="en" lgx="48,42" lgy="66,66"/>
			    <Label text="123" stroke="0xffffff" mouseEnabled="false" var="txt_have" backgroundColor="0xcfbeaf" autoSize="none" align="left" x="45" y="85" width="35" height="16" style="普通绿色" lgx="48,42" lgy="84,84" language="en"/>
			  </Box>
			  <List x="-64.5" y="-12" var="additionList" centerX="0" repeatY="2">
			    <Box name="render">
			      <Label text="物攻 + 2000" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" width="135" height="20" align="center" style="普通绿色" mouseChildren="false" name="itemTxt"/>
			    </Box>
			  </List>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var itemBox:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_need:Label = null;
      
      public var txt_have:Label = null;
      
      public var additionList:List = null;
      
      public function RuneComposeRenderUI()
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
