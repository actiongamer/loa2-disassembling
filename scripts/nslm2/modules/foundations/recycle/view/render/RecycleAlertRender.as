package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   
   public class RecycleAlertRender extends RecycleAlertRenderUI
   {
       
      
      public function RecycleAlertRender()
      {
         super();
         this.box_content.mask = this.img_mask;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            _loc4_ = param1 as int;
            var _loc5_:* = _loc4_;
            if(20010 !== _loc5_)
            {
               if(30110 !== _loc5_)
               {
                  if(30109 !== _loc5_)
                  {
                     if(30100 !== _loc5_)
                     {
                        if(11303 !== _loc5_)
                        {
                           if(30607 !== _loc5_)
                           {
                              if(30600 !== _loc5_)
                              {
                                 if(11305 !== _loc5_)
                                 {
                                    if(30500 !== _loc5_)
                                    {
                                       if(30501 !== _loc5_)
                                       {
                                          if(11307 !== _loc5_)
                                          {
                                             if(11309 === _loc5_)
                                             {
                                                _loc2_ = 30600403;
                                                _loc3_ = 32000;
                                             }
                                          }
                                       }
                                       addr42:
                                       _loc2_ = 30600400;
                                       _loc3_ = 11307;
                                    }
                                    §§goto(addr42);
                                 }
                              }
                              addr34:
                              _loc2_ = 30600402;
                              _loc3_ = 11305;
                           }
                           §§goto(addr34);
                        }
                        addr90:
                        this.box_content.visible = FuncOpenAutoCtrl.checkOpen(_loc3_);
                        this.txt_alert.text = LocaleMgr.ins.getStr(_loc2_);
                        this.img_bg.height = this.txt_alert.textHeight;
                        this.img_point.y = this.txt_alert.y + this.txt_alert.textHeight / 2;
                        this.box_content.y = 0;
                        this.box_content.alpha = 1;
                     }
                     addr26:
                     _loc2_ = 30600401;
                     _loc3_ = 11303;
                     §§goto(addr90);
                  }
                  addr25:
                  §§goto(addr26);
               }
               addr24:
               §§goto(addr25);
            }
            §§goto(addr24);
         }
      }
      
      public function autoHide() : void
      {
         TweenLite.killTweensOf(this.box_content);
         this.box_content.y = 0;
         this.box_content.alpha = 1;
         TweenLite.to(this.box_content,0.5,{
            "alpha":0,
            "y":-100,
            "delay":8
         });
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this.box_content);
         super.dispose();
      }
   }
}
