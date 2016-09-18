package game.ui.renzhengs.vipAuths
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class RenZhengVipModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="540">
			  <Image skin="png.uiRenZhengVips.img_bg" x="-34" y="-141"/>
			  <Image skin="png.uiRenZhengVips.img_role" x="-487" y="-191"/>
			  <Image skin="png.uiRenZhengVips.img_btn_bg" x="86" y="442"/>
			  <Image skin="png.uiRenZhengVips.img_1" x="-130" y="461"/>
			  <Button skin="png.uiRenZhengVips.btn_get" x="303" y="453" stateNum="1" var="btn_get"/>
			  <Image skin="png.uiRenZhengVips.img_slite" x="240" y="139"/>
			  <Image skin="png.uiRenZhengVips.img_title" x="240" y="69"/>
			  <Image skin="png.uiRenZhengVips.img_txt1" x="357" y="481" var="btn_get_label"/>
			  <Image skin="png.uiRenZhengVips.img_txt2" x="345" y="85"/>
			  <Label text="小标题" autoSize="none" x="-206" y="472" style="渐变1" size="16" width="400" height="25" var="txtQQ" align="center"/>
			  <List x="121" y="148" repeatY="7" spaceY="-4" var="list_content">
			    <RenZhengVipRender name="render" runtime="game.ui.renzhengs.vipAuths.RenZhengVipRenderUI"/>
			  </List>
			  <Label text="小标题" autoSize="none" x="111" y="120" style="小标题" size="16" width="574" height="23" var="txt1" align="center"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="-19" x="752" var="btn_close"/>
			  <Label text="小标题" autoSize="none" x="-160" y="502" style="小标题" size="16" width="308" height="23" var="txt_date" align="center"/>
			</PopModuleView>;
       
      
      public var btn_get:Button = null;
      
      public var btn_get_label:Image = null;
      
      public var txtQQ:Label = null;
      
      public var list_content:List = null;
      
      public var txt1:Label = null;
      
      public var btn_close:Button = null;
      
      public var txt_date:Label = null;
      
      public function RenZhengVipModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.renzhengs.vipAuths.RenZhengVipRenderUI"] = RenZhengVipRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
