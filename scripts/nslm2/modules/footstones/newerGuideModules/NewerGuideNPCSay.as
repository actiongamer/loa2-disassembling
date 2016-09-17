package nslm2.modules.footstones.newerGuideModules
{
   import game.ui.newerGuideModules.NewerGuideNPCSayUI;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   
   public class NewerGuideNPCSay extends NewerGuideNPCSayUI
   {
       
      
      public function NewerGuideNPCSay()
      {
         super();
         this.alpha = 0;
         this.visible = false;
         this.x = -200;
      }
      
      public function show(param1:StcGuideVo, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(param1.npc_id)
         {
            _loc3_ = StcMgr.ins.getNpcVo(param1.npc_id);
            this.img_left.skin = UrlLib.dialog(_loc3_.head_id);
            this.txt_name.text = LocaleMgr.ins.getStr(_loc3_.name);
            this.txt_content.text = LocaleMgr.ins.getStr(param1.talk);
            TweenLite.to(this,!!param2?0.4:0,{
               "alpha":1,
               "visible":true,
               "x":0
            });
         }
         else
         {
            this.hide(param2);
         }
      }
      
      public function hide(param1:Boolean = true) : void
      {
         TweenLite.to(this,!!param1?0.3:0,{
            "alpha":0,
            "visible":false,
            "x":-200
         });
      }
   }
}
