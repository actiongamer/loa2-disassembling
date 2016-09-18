package nslm2.modules.bag
{
   import game.ui.BagModules.UseGiftRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class UseGiftRender extends UseGiftRenderUI
   {
      
      public static const GIVE_CPL:String = "GIVE_CPL";
      
      public static const GET_CPL:String = "GET_CPL";
       
      
      private var _kind:int;
      
      public function UseGiftRender()
      {
         super();
         this.btn_do.addEventListener("click",btn_click);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.validateBtn();
         this.img_line.visible = !this.listCellVo.isLastLineInCurPage;
         this.txt_fightValue.visible = false;
      }
      
      public function get kind() : int
      {
         return _kind;
      }
      
      public function set kind(param1:int) : void
      {
         if(_kind != param1)
         {
            _kind = param1;
            validateBtn();
         }
      }
      
      public function validateBtn() : void
      {
         if(this.gameFriendData == null)
         {
            return;
         }
         if(!(int(_kind) - 1))
         {
            this.btn_do.label = LocaleMgr.ins.getStr(10600018);
            this.btn_do.disabled = false;
         }
      }
      
      private function btn_click(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(13406,!!this.gameFriendData?this.gameFriendData.id:null,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
