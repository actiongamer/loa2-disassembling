package game.ui.auctionShopModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class AuctionListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="554" height="28" buttonMode="true" mouseChildren="true">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="554" height="28"/>
			  <Image skin="png.a5.commonImgs.公会排行-选中" x="1" y="0" sizeGrid="4,4,4,4" width="554" height="30" var="img_selected" mouseChildren="true" smoothing="true"/>
			  <Label text="道具名字啦啦啦啦X100" autoSize="none" x="6" y="7" style="技能名标题" width="132" height="20" align="center" var="txt_itemName" mouseEnabled="true" mouseChildren="false"/>
			  <Label text="12小时" autoSize="none" x="185" y="7" style="普通说明" width="69" height="20" align="center" var="txt_time" mouseChildren="false"/>
			  <Label text="紫色" autoSize="none" x="136" y="7" style="技能名标题" width="52" height="20" align="center" var="txt_quality" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="游族22.S1200.六个字名字啊打的" autoSize="none" x="240" y="7" style="普通说明" width="166" height="20" align="center" var="txt_PlayerName" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.commonImgs.4" x="482" y="3" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="4000000" autoSize="none" x="503" y="7" style="普通说明" width="54" height="20" align="left" var="txt_price" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.a5.commonImgs.4" x="408" y="3" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="4000000" autoSize="none" x="429" y="7" style="普通说明" width="54" height="20" align="left" var="txt_OnePrice" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var txt_itemName:Label = null;
      
      public var txt_time:Label = null;
      
      public var txt_quality:Label = null;
      
      public var txt_PlayerName:Label = null;
      
      public var txt_price:Label = null;
      
      public var txt_OnePrice:Label = null;
      
      public function AuctionListRenderUI()
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
