package game.ui.resGetPoints
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ResGetPointResRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="330" height="82">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS4" x="0" y="0" var="bg"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="9" y="10" var="img_quality" sizeGrid="6,6,6,6" width="64" height="64"/>
			  <Image skin="png.comp.image" x="11" y="12" var="img_icon" width="60" height="60"/>
			  <Label text="999" color="0xcfbeaf" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" width="227" align="left" x="90" y="52" backgroundColor="0xcfbeaf" height="20"/>
			  <Label text="999999999999999" color="0xcfbeaf" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="120" align="left" x="88" y="11" backgroundColor="0xcfbeaf" size="15" height="45" wordWrap="true"/>
			  <Button label="获取途径" stateNum="1" buttonMode="true" labelColors="0xeac472,0xe1dfd6,0xada99b" labelSize="13" x="223" y="25" var="btn_enter" sizeGrid="53,15,53,15" style="按钮中绿" width="100"/>
			</WealthRender>;
       
      
      public var bg:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_countAndNeed:Label = null;
      
      public var txt_name:Label = null;
      
      public var btn_enter:Button = null;
      
      public function ResGetPointResRenderUI()
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
