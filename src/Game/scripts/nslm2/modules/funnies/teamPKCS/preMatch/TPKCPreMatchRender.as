package nslm2.modules.funnies.teamPKCS.preMatch
{
   import game.ui.teamPKCS.pre.TPKCMatchRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.CteamBattle;
   
   public class TPKCPreMatchRender extends TPKCMatchRenderUI
   {
       
      
      public function TPKCPreMatchRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            _loc5_ = LocaleMgr.ins.getStr(50800035);
            _loc4_ = LocaleMgr.ins.getStr(50800036);
            _loc3_ = LocaleMgr.ins.getStr(50800037);
            _loc2_ = param1.da as CteamBattle;
            this.txt.text = LocaleMgr.ins.getStr(50800034,[param1.index + 1]);
            if(param1.over)
            {
               if(param1.winnerSide)
               {
                  this.txt.text = this.txt.text + (_loc5_ + " " + _loc2_.winName + " " + _loc3_ + " " + _loc2_.loseName + " " + _loc4_);
               }
               else
               {
                  this.txt.text = this.txt.text + (_loc4_ + " " + _loc2_.loseName + " " + _loc3_ + " " + _loc2_.winName + " " + _loc5_);
               }
            }
            else if(param1.winnerSide)
            {
               this.txt.text = this.txt.text + (_loc2_.winName + " " + _loc3_ + " " + _loc2_.loseName);
            }
            else
            {
               this.txt.text = this.txt.text + (_loc2_.loseName + " " + _loc3_ + " " + _loc2_.winName);
            }
         }
      }
   }
}
