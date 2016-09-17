package game.ui.sougouModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class SogouModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="546" height="370">
			  <Image skin="png.a5.comps.img_block" x="14" y="39" width="518" height="323" var="img_bg"/>
			  <Image skin="png.uiSogou.外框" x="-15" y="-1"/>
			  <Image skin="png.uiSogou.文字2" x="99.5" y="52" var="img_titleGameCenter"/>
			  <Image skin="png.uiSogou.黄-透名底" x="27" y="143" width="492" height="146"/>
			  <Image skin="png.uiSogou.游戏大厅礼包" x="206" y="158" var="img_giftGameCenter"/>
			  <Image skin="png.uiSogou.文字1" x="72" y="59" var="img_titleSkin"/>
			  <Image skin="png.uiSogou.皮肤大礼包" x="217" y="160" var="img_giftSkin"/>
			  <Button label="立即领取" skin="png.a5.btns.btn_big_S3" x="213.5" y="298" stateNum="1" style="按钮大绿" var="btn_get"/>
			  <List x="99" y="194" repeatX="5" spaceX="12" var="list_reward">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_closeS1" x="501" y="5" stateNum="1" var="btn_close"/>
			  <Label text="标题" autoSize="none" style="渐变2" mouseEnabled="false" align="center" left="0" right="0" y="19" x="0" height="18" width="276" var="txt_titleName" mouseChildren="false"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_titleGameCenter:Image = null;
      
      public var img_giftGameCenter:Image = null;
      
      public var img_titleSkin:Image = null;
      
      public var img_giftSkin:Image = null;
      
      public var btn_get:Button = null;
      
      public var list_reward:List = null;
      
      public var btn_close:Button = null;
      
      public var txt_titleName:Label = null;
      
      public function SogouModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
