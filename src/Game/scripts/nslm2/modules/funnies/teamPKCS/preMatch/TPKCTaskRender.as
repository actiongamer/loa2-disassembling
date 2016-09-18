package nslm2.modules.funnies.teamPKCS.preMatch
{
   import game.ui.teamPKCS.pre.TPKCawardRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   
   public class TPKCTaskRender extends TPKCawardRenderUI
   {
       
      
      public function TPKCTaskRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            img_got.visible = param1.got == 1;
            txt.text = LocaleMgr.ins.getStr(50800060,[param1.times]) + "\n";
            _loc2_ = Math.min(param1.win,param1.times);
            if(param1.win >= param1.times)
            {
               txt.text = txt.text + ("<font color=\'#a9f16b\'>" + LocaleMgr.ins.getStr(50800061,[_loc2_,param1.times]) + "</font>");
            }
            else
            {
               txt.text = txt.text + ("<font color=\'#ff3000\'>" + LocaleMgr.ins.getStr(50800061,[_loc2_,param1.times]) + "</font>");
            }
            _loc3_ = WealthUtil.dropBaseByGroupIdToWealthVoArr(param1.rewardd);
            if(_loc3_.length >= 1)
            {
               reward.dataSource = _loc3_[0];
            }
         }
      }
   }
}
