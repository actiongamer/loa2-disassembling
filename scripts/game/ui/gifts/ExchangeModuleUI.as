package game.ui.gifts
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.TextInput;
   
   public class ExchangeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="400" height="300">
			  <PanelBg x="0" y="0" left="0" right="0" top="0" bottom="0"/>
			  <Button label="兑    换" style="按钮大绿" y="220" var="btn_exchange" centerX="0"/>
			  <Label text="激活码礼包领取:" autoSize="none" y="73" style="渐变1" width="362" height="49" align="center" centerX="0" x="19" multiline="true" wordWrap="true"/>
			  <Label text="请输入激活码礼包领取" autoSize="none" y="124" style="渐变2" width="388" height="25" align="center" centerX="0" x="6"/>
			  <Image skin="png.a5.bgs.输入框" x="70" y="155" var="txt_bg" width="260" height="24"/>
			  <TextInput x="73" y="154" width="255" height="26" sizeGrid="4,4,4,4" margin="2,3" var="txt_search" style="普通说明"/>
			  <TextInput x="78" y="159" width="188" height="18" var="txt_searchPrompt" text="搜索好友" color="0xa0a0a0" labelFilterKind="黑色1像素描边" mouseEnabled="false" mouseChildren="false" style="普通灰色"/>
			</PopModuleView>;
       
      
      public var btn_exchange:Button = null;
      
      public var txt_bg:Image = null;
      
      public var txt_search:TextInput = null;
      
      public var txt_searchPrompt:TextInput = null;
      
      public function ExchangeModuleUI()
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
