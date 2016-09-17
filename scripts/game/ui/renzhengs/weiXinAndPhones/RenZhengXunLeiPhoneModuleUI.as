package game.ui.renzhengs.weiXinAndPhones
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.WealthRenderS9noNameUI;
   
   public class RenZhengXunLeiPhoneModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="806" height="550">
			  <PanelBg y="0" width="806" height="550"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="30" var="img_bg1"/>
			  <Image skin="png.a5.comps.img_block" x="-259" y="-140" var="img_bg3"/>
			  <Image skin="png.a5.comps.img_block" x="72" y="134" var="img_bg2"/>
			  <Tab labels="标 签,标 签" style="TAB长" x="95" y="115" var="tab"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_shadow" x="329" y="202"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_shadow" x="413" y="202"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_shadow" x="496" y="202"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_shadow" x="580" y="202"/>
			  <List x="280" y="204" repeatX="4" spaceX="24" var="list_gift">
			    <WealthRenderS9noName name="render" runtime="game.ui.commons.icons.WealthRenderS9noNameUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="262" y="58" var="img_title1"/>
			  <ClipList value="599" clipWidth="33" align="left" url="png.uiRenZhengWeiXinAndPhones.clipList_num" x="572" y="79" var="num_value"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_point" x="536" y="51"/>
			  <RenZhengXunLeiPhonePanel x="152.5" y="325" var="panel_phoneUI" runtime="game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI"/>
			</PopModuleView>;
       
      
      public var img_bg1:Image = null;
      
      public var img_bg3:Image = null;
      
      public var img_bg2:Image = null;
      
      public var tab:Tab = null;
      
      public var list_gift:List = null;
      
      public var img_title1:Image = null;
      
      public var num_value:ClipList = null;
      
      public var panel_phoneUI:game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI = null;
      
      public function RenZhengXunLeiPhoneModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9noNameUI"] = WealthRenderS9noNameUI;
         viewClassMap["game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI"] = game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
