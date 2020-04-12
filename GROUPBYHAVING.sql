-- GROUP BY 절은 WHERE절과 ORDER BY 절 사이에 위치해 집계할 대상 컬럼이나 표현식을 명시하면 된다.

-- 지하철역 명으로 집계 
SELECT station_name
FROM subway_statistics
WHERE gubun = '승차'
GROUP BY station_name
ORDER BY station_name;

-- 집계함수 목록
-- COUNT( expr ) expr의 전체 개수를 구해 반환 
-- MAX( expr ) expr의 최댓값을 반환
-- MIN( expr ) expr의 최솟값을 반환
-- SUM( expr ) expr의 합계를 반환
-- AVG( expr ) expr의 평균값을 반환
-- VARIANCE( expr ) epxr의 분산을 반환
-- STDDEV( expr ) expr의 표준편차를 반환

-- 집계 함수 사용
SELECT COUNT(*) cnt,
       MIN(passenger_number) min_value,
       MAX(passenger_number) max_value,
       SUM(passenger_number) sum_value,
       AVG(passenger_number) avg_value
FROM subway_statistics;

-- 지하철역별 승차 인원 통계
SELECT station_name,
       COUNT(*) cnt,
       MIN(passenger_number) min_value,
       MAX(passenger_number) max_value,
       SUM(passenger_number) sum_value,
       AVG(passenger_number) avg_value
FROM subway_statistics
WHERE gubun = '승차'
GROUP BY station_name
ORDER BY station_name;

-- 구로디지털단지역 시간별 승하차 인원 조회
SELECT station_name,
       boarding_time,
       gubun,
       MIN(passenger_number) min_value,
       MAX(passenger_number) max_value,
       SUM(passenger_number) sum_value
FROM subway_statistics
WHERE station_name in ('구로디지털단지(232)')
GROUP BY station_name, boarding_time, gubun
ORDER BY station_name, boarding_time, gubun;


-- 승하차 인원이 많은 순서로 조회
SELECT station_name,
       boarding_time,
       gubun,
       MIN(passenger_number) min_value,
       MAX(passenger_number) max_value,
       SUM(passenger_number) sum_value
FROM subway_statistics
GROUP BY station_name, boarding_time, gubun
ORDER BY 6 DESC;

-- HAVING 절
SELECT station_name,
       boarding_time,
       gubun,
       MIN(passenger_number) min_value,
       MAX(passenger_number) max_value,
       SUM(passenger_number) sum_value
FROM subway_statistics
GROUP BY station_name, boarding_time, gubun
HAVING SUM(passenger_number) BETWEEN 15000 AND 16000
ORDER BY 6 DESC;

-- DISTINCT 사용
-- 컬럼에 들어있는 값에서 중복 값을 제외한 고유 값들만 조회된다.
SELECT DISTINCT station_name
FROM subway_statistics
WHERE gubun = '승차'
ORDER BY 1;