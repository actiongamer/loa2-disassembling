package nslm2.common.uiEffects
{
   import com.mz.core.utils2.task.TaskPool;
   import flash.display.DisplayObject;
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.common.vo.WealthVo;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Point;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.foundations.mainToolBar.MainBottomIconModule;
   import morn.core.components.List;
   import morn.core.components.Box;
   
   public class ListIconFlyEff extends TaskPool
   {
      
      public static const FLY_INTERVAL:int = 150;
       
      
      public var list:List;
      
      public var getFlyDspHandler;
      
      private var getFlyTaskHandler;
      
      public var getToTargetHandler;
      
      public var autoHideFrom:Boolean = true;
      
      public function ListIconFlyEff(param1:List)
      {
         getFlyDspHandler = getFlyDspFromWealthRender;
         getFlyTaskHandler = getFlyTaskHandlerFromWealthRender;
         getToTargetHandler = getToTargetFromWealthRender;
         super();
         this.list = param1;
      }
      
      public static function getFlyDspFromWealthRender(param1:ListIconFlyEff, param2:WealthRender) : DisplayObject
      {
         var _loc3_:* = null;
         if((param2 as WealthRender).wealthVoIsEnable)
         {
            _loc3_ = new Image(param2.ref_img_icon.skin);
            _loc3_.width = param2.ref_img_icon.width;
            _loc3_.height = param2.ref_img_icon.height;
            return _loc3_;
         }
         return null;
      }
      
      public static function getFlyTaskHandlerFromWealthRender(param1:ListIconFlyEff, param2:WealthRender, param3:int, param4:DisplayObject) : TaskBase
      {
         var _loc7_:* = null;
         var _loc5_:* = undefined;
         var _loc8_:* = null;
         var _loc6_:* = null;
         if((param2 as WealthRender).wealthVoIsEnable)
         {
            _loc7_ = (param2 as WealthRender).wealthVo;
            _loc5_ = Handler.executeAndReturn(param1.getToTargetHandler,[param1,param2]);
            var _loc9_:* = _loc7_.kind;
            if(20 !== _loc9_)
            {
               if(2121 !== _loc9_)
               {
                  return new WealthFlyEffectTask(_loc7_.kind,_loc7_.showCount,(param2 as WealthRender).ref_img_icon).setToPoi(_loc5_).set_delayExec(param3 * 150);
               }
            }
            if(_loc5_ == null)
            {
               return null;
            }
            _loc8_ = DisplayUtils.localToTarget(param2,UIMgr.stage);
            _loc6_ = new IconFlyEff(param4,_loc8_,_loc5_);
            _loc6_.set_delayExec(param3 * 150).set_scaleTo(0.4).addHandlers(itemIconFlyTask_cpl);
            return _loc6_;
         }
         return null;
      }
      
      public static function getToTargetFromWealthRender(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:* = null;
         var _loc4_:* = null;
         if((param2 as WealthRender).wealthVoIsEnable)
         {
            var _loc6_:* = (param2 as WealthRender).wealthVo.kind;
            if(1 !== _loc6_)
            {
               if(3 !== _loc6_)
               {
                  if(2 !== _loc6_)
                  {
                     if(7 !== _loc6_)
                     {
                        if(5 !== _loc6_)
                        {
                           if(12 !== _loc6_)
                           {
                              if(4 !== _loc6_)
                              {
                                 if(17 !== _loc6_)
                                 {
                                    if(10 !== _loc6_)
                                    {
                                       if(30 !== _loc6_)
                                       {
                                          _loc4_ = (GlobalRef.bottomModuleBtns as MainBottomIconModule).flyToIcon;
                                          if(_loc4_ != null)
                                          {
                                             _loc3_ = new FlyTarget(_loc4_,new Point(30,30));
                                          }
                                       }
                                       else
                                       {
                                          _loc3_ = new FlyTarget((GlobalRef.bottomModuleBtns as MainBottomIconModule).heroIcon,new Point(40,40));
                                       }
                                    }
                                    else
                                    {
                                       _loc5_ = (GlobalRef.bottomModuleBtns as MainBottomIconModule).expBar.img_tail.localToGlobal(new Point());
                                       _loc3_ = new FlyTarget(_loc5_,null);
                                    }
                                 }
                                 addr114:
                                 return _loc3_;
                              }
                              addr27:
                              _loc3_ = null;
                              §§goto(addr114);
                           }
                           addr26:
                           §§goto(addr27);
                        }
                        addr25:
                        §§goto(addr26);
                     }
                     addr24:
                     §§goto(addr25);
                  }
                  addr23:
                  §§goto(addr24);
               }
               addr22:
               §§goto(addr23);
            }
            §§goto(addr22);
         }
         else
         {
            return null;
         }
      }
      
      private static function itemIconFlyTask_cpl(param1:IconFlyEff) : void
      {
         var _loc2_:FlyTarget = param1.toPoi as FlyTarget;
         ArriveTickEff.createIns(_loc2_.target as DisplayObject).start();
      }
      
      public function set_getFlyDspHandler(param1:*) : ListIconFlyEff
      {
         this.getFlyDspHandler = param1;
         return this;
      }
      
      public function set_getFlyTaskHandler(param1:*) : ListIconFlyEff
      {
         this.getFlyTaskHandler = param1;
         return this;
      }
      
      public function set_getToTargetHandler(param1:*) : ListIconFlyEff
      {
         this.getToTargetHandler = param1;
         return this;
      }
      
      override public function exec() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = list.cells.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = list.cells[_loc5_];
            _loc2_ = Handler.executeAndReturn(this.getFlyDspHandler,[this,_loc1_]);
            if(_loc2_)
            {
               _loc3_ = Handler.executeAndReturn(this.getFlyTaskHandler,[this,_loc1_,_loc5_,_loc2_]);
               if(_loc3_)
               {
                  _loc3_.addStartHandler(flyTask_start);
                  _loc3_.dataSource = _loc1_;
                  this.addTask(_loc3_);
               }
            }
            _loc5_++;
         }
         super.exec();
      }
      
      public function set_autoHideFrom(param1:Boolean = true) : ListIconFlyEff
      {
         this.autoHideFrom = param1;
         return this;
      }
      
      private function flyTask_start(param1:TaskBase) : void
      {
         var _loc2_:* = null;
         if(autoHideFrom)
         {
            _loc2_ = param1.dataSource;
            _loc2_.visible = false;
         }
      }
   }
}
