package game.ui.vipModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   import morn.customs.components.ClipList;
   import morn.core.components.Tab;
   import morn.core.components.Button;
   
   public class VipModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="811" height="551">
			  <PanelBg x="0" y="0" width="842" height="608"/>
			  <Label autoSize="none" x="226" y="89" style="小标题" align="right" size="16" height="25" var="txt_title" language="en" lgx="180,226,226,90" lgy="89,89,89,89"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="12" y="145" sizeGrid="14,18,14,14" width="780" height="390" var="img_grid"/>
			  <Image skin="png.uiVip.底部图" x="16" y="143" var="img_funBg" width="773" height="382"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S10" x="250" y="63" var="process_bar"/>
			  <Image skin="png.uiVip.进度条-框" x="215" y="23"/>
			  <Image skin="png.uiVip.进度条-光点" x="248" y="42" var="img_spot" width="21" height="60"/>
			  <Image skin="png.uiVip.数字小.VIP" x="453" y="92"/>
			  <Image skin="png.uiVip.数字小.VIP" x="376" y="36"/>
			  <ClipList value="739" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="421" y="39" width="58" var="current_vip"/>
			  <ClipList value="739" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="500" y="95" var="next_vip"/>
			  <Label text="普通说明" autoSize="none" x="255" y="64" style="普通说明" width="306" align="center" var="txt_process" height="20"/>
			  <Label text="VIP特权" autoSize="center" x="269.5" y="-12" style="渐变1" align="center" bold="true" var="label_giftlast" size="30" width="300" height="35"/>
			  <Tab labels="VIP豪礼,VIP权益" x="23" y="120" selectedIndex="0" style="TAB短" var="tabBar"/>
			  <Button label="充值" skin="png.uiVip.btn_reCharge" x="627" y="47" stateNum="1" var="btn_charge"/>
			</PopModuleView>;
       
      
      public var txt_title:Label = null;
      
      public var img_grid:Image = null;
      
      public var img_funBg:Image = null;
      
      public var process_bar:ProgressBar = null;
      
      public var img_spot:Image = null;
      
      public var current_vip:ClipList = null;
      
      public var next_vip:ClipList = null;
      
      public var txt_process:Label = null;
      
      public var label_giftlast:Label = null;
      
      public var tabBar:Tab = null;
      
      public var btn_charge:Button = null;
      
      public function VipModuleUI()
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
