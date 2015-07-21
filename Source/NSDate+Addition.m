//
//  NSDate+Addition.m
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

- (NSString *)convertDateToStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat       = format;
    NSTimeZone *timeZone           = [NSTimeZone localTimeZone];
    dateFormatter.timeZone         = timeZone;
    NSLocale *locale               = [NSLocale systemLocale];
    dateFormatter.locale           = locale;
    NSString *dateString           = [dateFormatter stringFromDate:self];
    return dateString;
}

- (NSDate *)convertStringToDate:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat       = format;
    NSTimeZone *timeZone           = [NSTimeZone localTimeZone];
    dateFormatter.timeZone         = timeZone;
    NSLocale *locale               = [NSLocale systemLocale];
    dateFormatter.locale           = locale;
    NSDate *date                   = [dateFormatter dateFromString:string];
    return date;
}

- (NSString *)convertDateFromWhere:(NSInteger)index {
    
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSString* startDay = nil;
    if (index == 0) {
        startDay = [now convertDateToStringWithFormat:@"yyyy-MM-dd"];
    } else if (index == 1) {
        unsigned units = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSWeekdayCalendarUnit;
        NSCalendar *mycal=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comp;
        NSInteger month;
        NSInteger year;
        NSInteger day;
        
        NSCalendar *gregorian = [NSCalendar currentCalendar];
        NSDateComponents *dateComps = [gregorian components:NSWeekdayCalendarUnit fromDate:now];
        NSInteger daycount = [dateComps weekday] - 2;
        NSDate *weekdaybegin = [NSDate dateWithTimeIntervalSinceNow:-daycount*60*60*24];
        NSDateFormatter *df1=[[NSDateFormatter alloc]init];
        NSLocale *mylocal=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        [df1 setLocale:mylocal];
        [df1 setDateFormat:@"YYYY-MM-d"];
        now=weekdaybegin;
        comp=[mycal components:units fromDate:now];
        month=[comp month];
        year =[comp year];
        day=[comp day];
        startDay = [[NSString alloc]initWithFormat:@"%zd-%02zd-%02zd",year,month,day];
        
    } else if (index == 2) {

        NSDateComponents *comps = [cal
                                   components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday
                                   fromDate:now];
        comps.day = 1;
        NSDate *firstDay = [cal dateFromComponents:comps];
        startDay = [firstDay convertDateToStringWithFormat:@"yyyy-MM-dd"];
    } else if (index == 3) {
        NSDateComponents *comps = [cal components:NSCalendarUnitYear fromDate:now];
        comps.day = 1;
        NSDate *firstDay = [cal dateFromComponents:comps];
        startDay = [firstDay convertDateToStringWithFormat:@"yyyy-MM-dd"];
    }
    
    return startDay;
}

+ (NSString *)calculateDeltaT:(NSString *) timeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone *timeZone           = [NSTimeZone localTimeZone];
    dateFormatter.timeZone         = timeZone;
    NSLocale *locale               = [NSLocale systemLocale];
    dateFormatter.locale           = locale;
    NSDate *date = [dateFormatter dateFromString:timeString];
    NSTimeInterval refTimeInterval = [date timeIntervalSince1970];
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval deltaT = nowTimeInterval - refTimeInterval;

    NSInteger temp = 0;
    NSString *result = @"";
    
    if (deltaT < 60) {
        result = @"刚刚";
    } else if ((temp = deltaT/60) <60) {
        result = [NSString stringWithFormat:@"%zd分前",temp];
    } else if ((temp = temp/60) <24) {
        result = [NSString stringWithFormat:@"%zd小时前",temp];
    } else {
        result = timeString;
    }
    
    return result;
}


@end
