import cv2
import sys
from ultralytics import YOLO

def start_analysis(input_path, output_path):
    # 1. AI 모델 로드 (YOLOv8 기본 모델 사용)
    # 처음 실행 시 모델 파일(pt)을 자동으로 다운로드합니다.
    model = YOLO('yolov8n.pt') 

    # 2. 동영상 파일 열기
    cap = cv2.VideoCapture(input_path)
    if not cap.isOpened():
        print("영상을 열 수 없습니다.")
        return

    # 영상 속성 추출 (프레임 크기, FPS 등)
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fps = cap.get(cv2.CAP_PROP_FPS)

    # 3. 결과 영상 저장 설정 (MP4 코덱)
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter(output_path, fourcc, fps, (width, height))

    print("분석 시작...")

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break

        # 4. AI 분석 수행 (프레임에서 물체 찾기)
        # persist=True는 물체를 추적(Tracking)하라는 옵션입니다.
        results = model.track(frame, persist=True, verbose=False)

        # 5. 분석 결과가 입혀진 이미지 가져오기 (박스, 이름 등이 그려짐)
        annotated_frame = results[0].plot()

        # 6. 결과 파일에 한 프레임씩 저장
        out.write(annotated_frame)

    # 메모리 해제
    cap.release()
    out.release()
    print(f"분석 완료! 저장 위치: {output_path}")

if __name__ == "__main__":
    # 델파이에서 매개변수로 넘겨준 경로를 받음
    # 예: python analysis.py "input.mp4" "output.mp4"
    if len(sys.argv) > 2:
        in_file = sys.argv[1]
        out_file = sys.argv[2]
        start_analysis(in_file, out_file)
    else:
        print("사용법: python analysis.py [입력경로] [출력경로]")