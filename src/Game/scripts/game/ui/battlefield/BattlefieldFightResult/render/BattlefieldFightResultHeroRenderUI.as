package game.ui.battlefield.BattlefieldFightResult.render
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.ProgressBar;
   import game.ui.commons.icons.TupoClipRenderUI;
   
   public class BattlefieldFightResultHeroRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="70" height="77">
			  <Image skin="png.comp.image" x="4" y="6" var="img_icon" width="64" height="64" smoothing="true"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS2_3" x="-3" y="1" var="img_quality"/>
			  <Label text="Lv.98" x="18" y="50" color="0xebe5d6" width="46" height="18" var="txt_lv" align="right"/>
			  <List x="3" y="-6" repeatX="3" var="list_tupo">
			    <TupoClipRender name="render" runtime="game.ui.commons.icons.TupoClipRenderUI"/>
			  </List>
			  <Label text="名字" x="-11" y="91" width="94" height="18" var="txt_name" align="center" style="普通说明"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S3" x="-1" y="81" sizeGrid="2,0,10,0" centerX="0" var="progressBar_hp" value="0"/>
			  <Label text="80%" x="15" y="74" color="0xebe5d6" width="46" height="18" var="txt_hpValue" align="center"/>
			</PlayerRender>;
       
      
      public var img_icon:Image = null;
      
      public var img_quality:Image = null;
      
      public var txt_lv:Label = null;
      
      public var list_tupo:List = null;
      
      public var txt_name:Label = null;
      
      public var progressBar_hp:ProgressBar = null;
      
      public var txt_hpValue:Label = null;
      
      public function BattlefieldFightResultHeroRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.TupoClipRenderUI"] = TupoClipRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
