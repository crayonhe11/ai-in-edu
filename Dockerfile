FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 HOST=0.0.0.0 PORT=10000
WORKDIR /app
COPY InquiryLab-source.zip /tmp/InquiryLab-source.zip
RUN python -m zipfile -e /tmp/InquiryLab-source.zip /app && rm /tmp/InquiryLab-source.zip && useradd --create-home --uid 10001 inquiry && mkdir -p /tmp/inquiry-data && chown inquiry:inquiry /tmp/inquiry-data
USER inquiry
EXPOSE 10000
CMD ["python", "main.py", "--no-browser"]
