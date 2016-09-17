package nslm2.modules.foundations.vip.view
{
   import morn.core.components.Component;
   import com.mz.core.interFace.IObserver;
   import morn.core.components.Label;
   import nslm2.modules.foundations.vip.model.VipModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class VipHintBox extends Component implements IObserver
   {
       
      
      public var hint:Label;
      
      private var link:Label;
      
      private var _func:int;
      
      private var initLinkX:int;
      
      public function VipHintBox(param1:int, param2:Number, param3:Number)
      {
         super();
         _func = param1;
         ObserverMgr.ins.regObserver(this);
         hint = new Label();
         hint.width = 215;
         hint.x = param2 - 37;
         hint.y = param3;
         hint.align = "right";
         hint.isHtml = true;
         link = new Label();
         link.isHtml = true;
         link.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(999000382),new TextFormat(null,null,458496));
         link.underline = true;
         link.x = hint.x + hint.width + 5;
         initLinkX = link.x;
         link.y = -1 + param3;
         link.mouseChildren = false;
         link.buttonMode = true;
         link.addEventListener("click",click);
         setHintText(param1);
         this.addChild(hint);
         this.addChild(link);
      }
      
      private function setHintText(param1:int) : void
      {
         var _loc2_:String = VipModel.ins.getNextUpValue(param1);
         if(_loc2_.split(",").length == 1)
         {
            this.visible = false;
            return;
         }
         var _loc3_:* = param1;
         if(10020 !== _loc3_)
         {
            if(10310 !== _loc3_)
            {
               if(10210 !== _loc3_)
               {
                  if(10100 !== _loc3_)
                  {
                     if(10110 !== _loc3_)
                     {
                        if(10060 !== _loc3_)
                        {
                           if(11100 !== _loc3_)
                           {
                              if(10040 !== _loc3_)
                              {
                                 if(10420 !== _loc3_)
                                 {
                                    if(10410 !== _loc3_)
                                    {
                                       if(10500 !== _loc3_)
                                       {
                                          if(10520 !== _loc3_)
                                          {
                                             if(10510 !== _loc3_)
                                             {
                                                if(10600 !== _loc3_)
                                                {
                                                   if(10610 !== _loc3_)
                                                   {
                                                      if(10030 !== _loc3_)
                                                      {
                                                         if(11270 === _loc3_)
                                                         {
                                                            hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100332,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                                            link.visible = true;
                                                         }
                                                      }
                                                      else
                                                      {
                                                         hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100343,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                                         hint.align = "left";
                                                         link.visible = false;
                                                      }
                                                   }
                                                   else
                                                   {
                                                      hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100342,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                                      link.x = initLinkX - 26;
                                                   }
                                                }
                                                else
                                                {
                                                   hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100341,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                                   hint.align = "left";
                                                   link.visible = false;
                                                }
                                             }
                                             else
                                             {
                                                hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100340,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                                hint.align = "left";
                                                link.visible = false;
                                             }
                                          }
                                          else
                                          {
                                             hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100339,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                             hint.align = "left";
                                             link.visible = false;
                                          }
                                       }
                                       else
                                       {
                                          hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100338,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                          hint.align = "left";
                                          link.visible = false;
                                       }
                                    }
                                    else
                                    {
                                       hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100337,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                    }
                                 }
                                 else
                                 {
                                    hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100336,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                                    link.x = initLinkX - 30;
                                 }
                              }
                              else
                              {
                                 hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100335,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
                              }
                           }
                        }
                        hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100334,[_loc2_.split(",")[0],_loc2_.split(",")[1] * 100]),new TextFormat(null,null,16046112));
                        link.x = initLinkX - 40;
                     }
                  }
                  hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100333,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
               }
               addr464:
               if(link.x < hint.x + hint.width)
               {
                  link.x = hint.x + hint.width + 5;
               }
               return;
            }
            addr23:
            hint.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100332,[_loc2_.split(",")[0],_loc2_.split(",")[1]]),new TextFormat(null,null,16046112));
            §§goto(addr464);
         }
         §§goto(addr23);
      }
      
      protected function click(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(10800,"VipPrivilegesView");
      }
      
      public function getFocusNotices() : Array
      {
         return ["PLAYER_VIP_UP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("PLAYER_VIP_UP" === _loc3_)
         {
            setHintText(_func);
         }
      }
   }
}
