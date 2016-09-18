package nslm2.modules.fightPlayer
{
   import flash.geom.Point;
   
   public class PosConts
   {
      
      public static const NONE:int = 0;
      
      public static const LEFT:int = 1;
      
      public static const RIGHT:int = 2;
      
      public static const BOTH:int = 3;
      
      public static const L0:int = 100;
      
      public static const L1:int = 101;
      
      public static const L2:int = 102;
      
      public static const L3:int = 103;
      
      public static const L4:int = 104;
      
      public static const L5:int = 105;
      
      public static const L6:int = 106;
      
      public static const L7:int = 107;
      
      public static const L8:int = 108;
      
      public static const R0:int = 200;
      
      public static const R1:int = 201;
      
      public static const R2:int = 202;
      
      public static const R3:int = 203;
      
      public static const R4:int = 204;
      
      public static const R5:int = 205;
      
      public static const R6:int = 206;
      
      public static const R7:int = 207;
      
      public static const R8:int = 208;
      
      public static const P0:int = 0;
      
      public static const P1:int = 1;
      
      public static const P2:int = 2;
      
      public static const P3:int = 3;
      
      public static const P4:int = 4;
      
      public static const P5:int = 5;
      
      public static const P6:int = 6;
      
      public static const P7:int = 7;
      
      public static const P8:int = 8;
      
      public static const MAX_ORDER_ONE_SIDE:int = 9;
      
      public static const COL_FRONT:int = 1;
      
      public static const COL_MIDDLE:int = 2;
      
      public static const COL_BACK:int = 3;
      
      public static const OFFSET_Y:int = 0;
      
      public static const OFFSET_X_NORMAL:int = 30;
      
      public static const xyArrL:Array = [new Point(-223 - 30,700 + 0),new Point(-268,350 + 0),new Point(-278,0),new Point(-410 - 30,700 + 0),new Point(-455,350 + 0),new Point(-465,0 + 0),new Point(-580 - 30,700 + 0),new Point(-625,350 + 0),new Point(-635,0 + 0)];
      
      public static const xyArrR:Array = [new Point(223 + 30,700 + 0),new Point(223 + 30 + 15,350 + 0),new Point(223 + 30 + 25,0),new Point(410 + 30,700 + 0),new Point(410 + 30 + 15,350 + 0),new Point(410 + 30 + 25,0 + 0),new Point(580 + 30,700 + 0),new Point(580 + 30 + 15,350 + 0),new Point(580 + 30 + 25,0 + 0)];
      
      public static const OFFSET_X_BOSS_LEFT:int = -100;
      
      public static const xyArrL_BOSS:Array = [new Point(0 + -100,270),new Point(0 + -100,0),new Point(0 + -100,-270),new Point(-300 + -100,270),new Point(-300 + -100,0),new Point(-300 + -100,-270),new Point(-600 + -100,270),new Point(-600 + -100,0),new Point(-600 + -100,-270)];
      
      public static const OFFSET_X_BOSS:int = 800;
      
      public static const OFFSET_BOSS_Y_GAP:int = 270;
      
      public static const xyArrR_BOSS:Array = [new Point(0 + 800,270),new Point(0 + 800,0),new Point(0 + 800,-270),new Point(300 + 800,270),new Point(300 + 800,0),new Point(300 + 800,-270),new Point(600 + 800,270),new Point(600 + 800,0),new Point(600 + 800,-270)];
      
      public static const POS_ARR:Array = [0,1,2,3,4,5,6,7,8];
      
      public static const LEFT_ARR:Array = [100,101,102,103,104,105,106,107,108];
      
      public static const RIGHT_ARR:Array = [200,201,202,203,204,205,206,207,208];
       
      
      public function PosConts()
      {
         super();
      }
      
      public static function oriXY(param1:int, param2:Boolean, param3:Boolean = true) : Point
      {
         var _loc4_:Array = !!param3?!!param2?xyArrL_BOSS:xyArrR_BOSS:!!param2?xyArrL:xyArrR;
         return (_loc4_[param1] as Point).clone();
      }
      
      public static function LRtoP(param1:int) : int
      {
         return param1 % 100;
      }
      
      public static function pToLR(param1:int, param2:Boolean) : int
      {
         return !!param2?100 + param1:Number(200 + param1);
      }
      
      public static function col(param1:int) : int
      {
         var _loc2_:* = param1;
         if(100 !== _loc2_)
         {
            if(101 !== _loc2_)
            {
               if(102 !== _loc2_)
               {
                  if(200 !== _loc2_)
                  {
                     if(201 !== _loc2_)
                     {
                        if(202 !== _loc2_)
                        {
                           if(103 !== _loc2_)
                           {
                              if(203 !== _loc2_)
                              {
                                 if(104 !== _loc2_)
                                 {
                                    if(105 !== _loc2_)
                                    {
                                       if(204 !== _loc2_)
                                       {
                                          if(205 !== _loc2_)
                                          {
                                             if(106 !== _loc2_)
                                             {
                                                if(206 !== _loc2_)
                                                {
                                                   if(107 !== _loc2_)
                                                   {
                                                      if(108 !== _loc2_)
                                                      {
                                                         if(207 !== _loc2_)
                                                         {
                                                            if(208 !== _loc2_)
                                                            {
                                                               return 0;
                                                            }
                                                         }
                                                         addr28:
                                                         return 3;
                                                      }
                                                      addr27:
                                                      §§goto(addr28);
                                                   }
                                                   addr26:
                                                   §§goto(addr27);
                                                }
                                                addr25:
                                                §§goto(addr26);
                                             }
                                             §§goto(addr25);
                                          }
                                       }
                                       addr19:
                                       return 2;
                                    }
                                    addr18:
                                    §§goto(addr19);
                                 }
                                 addr17:
                                 §§goto(addr18);
                              }
                              addr16:
                              §§goto(addr17);
                           }
                           §§goto(addr16);
                        }
                     }
                     addr10:
                     return 1;
                  }
                  addr9:
                  §§goto(addr10);
               }
               addr8:
               §§goto(addr9);
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
   }
}
