package game.ui.auctionShopModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class MyOrderListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="554" height="28" buttonMode="true">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="554" height="28"/>
			  <Image skin="png.a5.commonImgs.公会排行-选中" x="1" y="0" sizeGrid="4,4,4,4" width="554" height="30" var="img_selected" mouseChildren="true"/>
			  <Label text="道具名字啦啦啦啦" autoSize="none" x="6" y="7" style="技能名标题" width="132" height="20" align="center" var="txt_itemName" mouseChildren="false"/>
			  <Label text="12小时" autoSize="none" x="202" y="7" style="普通说明" width="87" height="20" align="center" var="txt_time" mouseChildren="false"/>
			  <Label text="紫色" autoSize="none" x="141" y="7" style="技能名标题" width="53" height="20" align="center" var="txt_quality" mouseChildren="false"/>
			  <Image skin="png.a5.commonImgs.4" x="296" y="4"/>
			  <Label text="4000000" autoSize="none" x="317" y="8" style="普通说明" width="54" height="20" align="left" var="txt_price" mouseChildren="false"/>
			  <Image skin="png.a5.commonImgs.4" x="395" y="4"/>
			  <Label text="4000000" autoSize="none" x="416" y="8" style="普通说明" width="54" height="20" align="left" var="txt_priceTotal" mouseChildren="false"/>
			  <Label text="竞价中" autoSize="none" x="492" y="7" style="普通绿色" width="54" height="20" align="left" var="txt_status" mouseChildren="false"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var txt_itemName:Label = null;
      
      public var txt_time:Label = null;
      
      public var txt_quality:Label = null;
      
      public var txt_price:Label = null;
      
      public var txt_priceTotal:Label = null;
      
      public var txt_status:Label = null;
      
      public function MyOrderListRenderUI()
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
