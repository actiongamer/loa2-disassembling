package game.ui.treasures.runeBag
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class RuneComposeRenderToUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="54" height="110">
			  <Label text="突破时" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="-11" y="-18" width="92" height="18" align="center" style="普通说明" mouseChildren="false"/>
			  <Box x="-14" y="18" var="itemBox">
			    <Label text="合成数量：" stroke="0xffffff" mouseEnabled="false" var="txt_getCnt" backgroundColor="0xcfbeaf" autoSize="none" align="center" y="66" width="98" height="16" style="普通说明" x="0"/>
			    <Box x="17">
			      <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			      <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56" smoothing="true"/>
			    </Box>
			  </Box>
			  <List x="-32" y="-2" centerX="0" repeatY="2" var="additionList">
			    <Box name="render">
			      <Label text="物攻 + 2000" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" width="135" height="20" align="center" style="普通绿色" mouseChildren="false" name="itemTxt"/>
			    </Box>
			  </List>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var itemBox:Box = null;
      
      public var txt_getCnt:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var additionList:List = null;
      
      public function RuneComposeRenderToUI()
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
