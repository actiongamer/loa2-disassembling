package game.ui.guildModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   
   public class GuildUpgradePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="488" height="313">
			  <PanelBgS3 x="2" y="1" width="488" height="313" bgStyle="5" bgSizeGrid="4,35,4,20"/>
			  <Image skin="png.uiGuildModule.升级职位" x="25.5" y="74"/>
			  <Image skin="png.uiGuildModule.升级职位" x="282" y="74"/>
			  <Label text="会员" autoSize="none" x="46" y="117" bold="true" var="txt_postName" style="重要提示黄" align="center" width="140" height="18" size="14"/>
			  <Label text="中级会员" autoSize="none" x="307" y="117" bold="true" var="txt_nextPostName" style="重要提示黄" size="14" width="137" height="18" align="center"/>
			  <Label text="\l40700050 " autoSize="left" x="73" y="174" bold="false" width="63" style="普通说明"/>
			  <Label text="10000" autoSize="left" x="131" y="175" color="0xFFFF00" bold="false" var="txt_salary" width="63" style="普通说明"/>
			  <Button label="\l40700051 " stateNum="1" buttonMode="true" labelFont="SSZH" y="263" var="btn_upgrade" style="按钮中绿" centerX="0"/>
			  <Label text="\l40700048 " autoSize="left" x="33" y="88" style="小标题" width="167" height="20" align="center"/>
			  <Label text="\l40700049 " autoSize="left" x="293" y="88" style="小标题" width="163" height="20" align="center"/>
			  <Box x="323" y="174" var="box_nextSa">
			    <Label text="\l40700050 " bold="false" width="63" style="普通说明"/>
			    <Label text="15000" autoSize="left" x="59" color="0xFFFF00" bold="false" var="txt_salaryNext" width="63" style="普通说明"/>
			  </Box>
			  <Label text="\l40700004" autoSize="none" x="309" y="118" bold="true" var="txt_top" style="不足禁止红" size="14" width="137" height="18" align="center"/>
			  <Label text="需要贡献度：1000000" autoSize="none" x="150" y="228" var="txt_need" style="普通说明" width="190" height="18" align="center"/>
			  <Box x="31" y="52" space="8">
			    <Label autoSize="left" bold="false" style="普通说明" text="\l40700000" var="txt_conLbl"/>
			    <Label text="10000" autoSize="left" x="104" var="txt_con" style="升级后加底标题"/>
			  </Box>
			</PopModuleView>;
       
      
      public var txt_postName:Label = null;
      
      public var txt_nextPostName:Label = null;
      
      public var txt_salary:Label = null;
      
      public var btn_upgrade:Button = null;
      
      public var box_nextSa:Box = null;
      
      public var txt_salaryNext:Label = null;
      
      public var txt_top:Label = null;
      
      public var txt_need:Label = null;
      
      public var txt_conLbl:Label = null;
      
      public var txt_con:Label = null;
      
      public function GuildUpgradePanelUI()
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
