package game.ui.arenas.mains
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ArenaBattleResultModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="427" height="186">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" y="-22.5" x="-58.5"/>
			  <Label text="\l50200703" x="25" y="51" width="377" align="center" height="22" var="txt_historyRank" style="普通说明"/>
			  <Label text="排名上升了" x="25" y="81" width="377" align="center" height="22" var="txt_upedRank" style="普通说明"/>
			  <Label text="\l50200704" x="25" y="110" width="377" align="center" height="21" var="txt_reward" style="普通说明"/>
			  <Label text="\l50200405" x="25" y="18" width="377" align="center" height="22" style="渐变1"/>
			  <Button label="\l9010100" x="154" style="按钮大绿" y="137" var="btn_confirm"/>
			</PopModuleView>;
       
      
      public var txt_historyRank:Label = null;
      
      public var txt_upedRank:Label = null;
      
      public var txt_reward:Label = null;
      
      public var btn_confirm:Button = null;
      
      public function ArenaBattleResultModuleUI()
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
