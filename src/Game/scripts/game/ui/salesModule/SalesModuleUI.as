package game.ui.salesModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   
   public class SalesModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="827" height="559">
			  <PanelBg x="8" y="6" width="804" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="19" y="32" var="img_panelBg" width="791" height="256"/>
			  <Image skin="png.a5.comps.img_block" x="-242" y="-172" var="img_person" width="752" height="712" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="78" y="143" var="img_bg" width="724" height="416"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="749" y="8" var="img_help" stateNum="1" buttonMode="true"/>
			  <Tab labels="\l60540011,\l60540012" x="99" y="121" selectedIndex="0" style="TAB超长" space="9" var="tabBar"/>
			  <Label text="优惠进度达到100，可随机获得一档充值返利" autoSize="none" x="145" y="95" style="普通说明" width="502" var="label_desc" align="center" size="15" height="23"/>
			  <Button label="优惠充值" skin="png.uiSales.btn_reCharge" x="593" y="54" stateNum="1" letterSpacing="1" var="btn_charge"/>
			  <Image skin="png.uiSales.经验条-黄光" x="228" y="70"/>
			  <ProgressBar skin="png.uiSales.progress" x="234" y="46" var="progressBar" width="326"/>
			  <Image skin="png.uiSales.进度条框" x="218" y="59" var="img_progressBg"/>
			  <Label text="pageBarS2" autoSize="none" x="218" y="66" style="普通说明" width="359" height="20" align="center" mouseChildren="false" mouseEnabled="false" var="label_process"/>
			  <Image skin="png.uiSales.img_light" x="971" y="261" rotation="90" width="491" height="517" alpha="0.8" scale="0.2" var="img_light" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiSales.星点" x="196" y="405" scale="0.7" var="img_star"/>
			</PopModuleView>;
       
      
      public var img_panelBg:Image = null;
      
      public var img_person:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_help:Button = null;
      
      public var tabBar:Tab = null;
      
      public var label_desc:Label = null;
      
      public var btn_charge:Button = null;
      
      public var progressBar:ProgressBar = null;
      
      public var img_progressBg:Image = null;
      
      public var label_process:Label = null;
      
      public var img_light:Image = null;
      
      public var img_star:Image = null;
      
      public function SalesModuleUI()
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
