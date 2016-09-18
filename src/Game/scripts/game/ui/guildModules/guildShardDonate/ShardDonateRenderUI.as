package game.ui.guildModules.guildShardDonate
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.ProgressBar;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class ShardDonateRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="120">
			  <Image skin="png.uiGuildModule.heroShard.右方捐献框红" x="-15" y="-17" var="bg_other"/>
			  <Image skin="png.uiGuildModule.heroShard.右方捐献框蓝" x="-15" y="-17" var="bg_self"/>
			  <Label text="林动" autoSize="left" x="10" y="11" style="普通绿色" var="txtReqName"/>
			  <Label text="\l999004001" autoSize="left" x="48" y="11" style="普通说明" var="txtReqName1"/>
			  <List x="9" y="40" var="list_wealth" repeatX="1">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="\l999004002" autoSize="left" x="100" y="41" style="重要提示黄" var="txtOwnNum"/>
			  <Label text="\l999004003" autoSize="left" x="100" y="78" style="普通说明"/>
			  <Button x="303" y="37" style="按钮中黄" var="btn_donate" label="\l350010038"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="179" y="80" sizeGrid="10,0,12,0" var="progressBar" width="209" height="15"/>
			  <Label text="\l999004004" autoSize="left" x="10" y="116" style="普通说明" var="txtCD1"/>
			  <Label text="\l999004005" y="116" style="普通说明" x="192" width="198" height="20" align="right" var="txtCD2"/>
			  <Label text="1/2" x="184" y="78" style="普通说明" width="201" height="20" align="center" var="txtProgress"/>
			</View>;
       
      
      public var bg_other:Image = null;
      
      public var bg_self:Image = null;
      
      public var txtReqName:Label = null;
      
      public var txtReqName1:Label = null;
      
      public var list_wealth:List = null;
      
      public var txtOwnNum:Label = null;
      
      public var btn_donate:Button = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txtCD1:Label = null;
      
      public var txtCD2:Label = null;
      
      public var txtProgress:Label = null;
      
      public function ShardDonateRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
